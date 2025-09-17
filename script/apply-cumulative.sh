#!/usr/bin/env bash
set -euo pipefail

# Apply a cumulative checkpoint (raw diff) and then any numbered deltas after the checkpoint.
# Usage: script/apply-cumulative.sh [--patch <path>]

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

PATCH_DIR=".reapply-patches/macOS-modernization"
LATEST_CUM_PATCH=""
if ls -1 "$PATCH_DIR"/*-cumulative.patch >/dev/null 2>&1; then
  LATEST_CUM_PATCH=$(ls -1 "$PATCH_DIR"/*-cumulative.patch | sort | tail -n1)
fi

PATCH_PATH="${LATEST_CUM_PATCH:-}"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --patch) PATCH_PATH="$2"; shift 2;;
    -h|--help) echo "Usage: $0 [--patch <path>]"; exit 0;;
    *) echo "Unknown arg: $1" >&2; exit 1;;
  esac
done

if [[ -z "$PATCH_PATH" || ! -f "$PATCH_PATH" ]]; then
  echo "Cumulative patch not found. Specify with --patch or ensure one exists in $PATCH_DIR" >&2
  exit 1
fi

if git apply --check "$PATCH_PATH" >/dev/null 2>&1; then
  git apply --index --whitespace=fix "$PATCH_PATH"
else
  git apply --3way --index --whitespace=fix "$PATCH_PATH"
fi
git commit -m "macOS: apply $(basename "$PATCH_PATH")"

# Apply deltas after checkpoint 
CHECKPOINT_FILE="$PATCH_DIR/CHECKPOINT"
SERIES_COVERED="0000"
if [[ -f "$CHECKPOINT_FILE" ]]; then
  SERIES_COVERED=$(awk -F= '/^COVERS=/{print $2}' "$CHECKPOINT_FILE" 2>/dev/null | tr -d '\r\n' || echo "0000")
fi
apply_deltas=()
for p in "$PATCH_DIR"/00*.patch; do
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

echo "Applied: $PATCH_PATH"

