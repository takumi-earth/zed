#!/usr/bin/env bash
set -euo pipefail

# Create a new worktree branch from latest upstream base.
# Usage: script/new-worktree.sh --branch <name> [--base auto|main|nightly]

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

BRANCH_NAME=""
BASE_MODE="auto"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --branch) BRANCH_NAME="$2"; shift 2;;
    --base) BASE_MODE="$2"; shift 2;;
    -h|--help) echo "Usage: $0 --branch <name> [--base auto|main|nightly]"; exit 0;;
    *) echo "Unknown arg: $1" >&2; exit 1;;
  esac
done

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

if [[ -z "$BRANCH_NAME" ]]; then echo "--branch required" >&2; exit 1; fi

WT_DIR="$ROOT_DIR/worktrees/$BRANCH_NAME"
mkdir -p "$ROOT_DIR/worktrees"

echo "Creating worktree: $WT_DIR (branch $BRANCH_NAME) from $BASE_REF ($BASE_SHORT)"
GIT_DIR="$(git rev-parse --git-dir)" git worktree add "$WT_DIR" "$BASE_REF" -b "$BRANCH_NAME" >/dev/null
echo "Done: $WT_DIR"

