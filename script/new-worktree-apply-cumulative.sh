#!/usr/bin/env bash
set -euo pipefail

# Create a new worktree on the newest upstream base and apply the latest
# cumulative checkpoint, then any numbered deltas beyond CHECKPOINT.COVERS.
# Agentic hint: prints WORKTREE= and BRANCH= on success.
# Usage: script/new-worktree-apply-cumulative.sh [--patch <path>] [--branch <name>] [--base auto|main|nightly] [--push]

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

PATCH_DIR=".reapply-patches/macOS-modernization"
LATEST_CUM_PATCH=""
if ls -1 "$PATCH_DIR"/*-cumulative.patch >/dev/null 2>&1; then
  LATEST_CUM_PATCH=$(ls -1 "$PATCH_DIR"/*-cumulative.patch | sort | tail -n1)
fi

PATCH_PATH="${LATEST_CUM_PATCH:-}"
BRANCH_NAME=""
BASE_MODE="auto"
DO_PUSH=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --patch) PATCH_PATH="$2"; shift 2;;
    --branch) BRANCH_NAME="$2"; shift 2;;
    --base) BASE_MODE="$2"; shift 2;;
    --push) DO_PUSH=1; shift;;
    -h|--help) echo "Usage: $0 [--patch <path>] [--branch <name>] [--base auto|main|nightly] [--push]"; exit 0;;
    *) echo "Unknown arg: $1" >&2; exit 1;;
  esac
done

if [[ -z "$PATCH_PATH" || ! -f "$PATCH_PATH" ]]; then
  echo "Cumulative patch not found. Specify with --patch or ensure one exists in $PATCH_DIR" >&2
  exit 1
fi

if [[ "${PATCH_PATH:0:1}" == "/" ]]; then
  PATCH_ABS="$PATCH_PATH"
else
  PATCH_ABS="$ROOT_DIR/$PATCH_PATH"
fi

pick_base() {
  local mode="$1"; local main_ref="upstream/main"; local nightly_ref="upstream/nightly"; local nightly_tag="refs/tags/nightly"
  if [[ "$mode" == "main" ]]; then echo "$main_ref"; return; fi
  if [[ "$mode" == "nightly" ]]; then
    git rev-parse -q --verify "$nightly_ref" >/dev/null && { echo "$nightly_ref"; return; }
    git rev-parse -q --verify "$nightly_tag" >/dev/null && { echo "$nightly_tag"; return; }
    echo "$main_ref"; return
  fi
  local main_ts=0 night_ts=0 night_ref=""
  git rev-parse -q --verify "$main_ref" >/dev/null && main_ts=$(git log -1 --format=%ct "$main_ref" || echo 0)
  if git rev-parse -q --verify "$nightly_ref" >/dev/null; then night_ref="$nightly_ref"; night_ts=$(git log -1 --format=%ct "$nightly_ref" || echo 0)
  elif git rev-parse -q --verify "$nightly_tag" >/dev/null; then night_ref="$nightly_tag"; night_ts=$(git log -1 --format=%ct "$nightly_tag" || echo 0); fi
  if [[ -n "$night_ref" && $night_ts -gt $main_ts ]]; then echo "$night_ref"; else echo "$main_ref"; fi
}

git fetch upstream --tags --prune >/dev/null 2>&1 || true
BASE_REF=$(pick_base "$BASE_MODE")
BASE_SHORT=$(git rev-parse --short "$BASE_REF")

if [[ -z "$BRANCH_NAME" ]]; then BRANCH_NAME="macOS-modernization-apply-$(date +%Y%m%d-%H%M%S)"; fi

WT_DIR="$ROOT_DIR/worktrees/$BRANCH_NAME"
mkdir -p "$ROOT_DIR/worktrees"
echo "Creating worktree: $WT_DIR (branch $BRANCH_NAME) from $BASE_REF ($BASE_SHORT)"
GIT_DIR="$(git rev-parse --git-dir)" git worktree add "$WT_DIR" "$BASE_REF" -b "$BRANCH_NAME" >/dev/null

pushd "$WT_DIR" >/dev/null
if git apply --check "$PATCH_ABS" >/dev/null 2>&1; then
  git apply --index --whitespace=fix "$PATCH_ABS"
else
  git apply --3way --index --whitespace=fix "$PATCH_ABS"
fi
git commit -m "macOS: apply $(basename "$PATCH_ABS")"

# Apply deltas after checkpoint (use CHECKPOINT.COVERS to filter)
PATCH_DIR_ABS="$ROOT_DIR/.reapply-patches/macOS-modernization"
CHECKPOINT_FILE="$PATCH_DIR_ABS/CHECKPOINT"
SERIES_COVERED="0000"
if [[ -f "$CHECKPOINT_FILE" ]]; then
  SERIES_COVERED=$(awk -F= '/^COVERS=/{print $2}' "$CHECKPOINT_FILE" 2>/dev/null | tr -d '\r\n' || echo "0000")
fi
apply_deltas=()
for p in "$PATCH_DIR_ABS"/00*.patch; do
  [[ -f "$p" ]] || continue
  base=$(basename "$p")
  num=$(printf "%s" "$base" | sed -E 's/^([0-9]{4}).*/\1/')
  if [[ -n "$num" ]] && ((10#$num > 10#$SERIES_COVERED)); then
    apply_deltas+=("$p")
  fi
done
if [[ ${#apply_deltas[@]} -gt 0 ]]; then
  git am -3 "${apply_deltas[@]}"
fi

if [[ $DO_PUSH -eq 1 ]]; then git push -u origin "$BRANCH_NAME"; fi
popd >/dev/null

echo "WORKTREE=$WT_DIR"
echo "BRANCH=$BRANCH_NAME"

exit 0
