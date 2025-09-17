#!/usr/bin/env bash
set -euo pipefail

# Validate that a patch series directory contains a CHECKPOINT and at least one
# cumulative patch. Enforces presence and basic consistency.
#
# Usage:
#   script/validate-patch-setup.sh [--series <path>]
# Default series: .reapply-patches/macOS-modernization

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

SERIES=".reapply-patches/macOS-modernization"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --series) SERIES="$2"; shift 2;;
    -h|--help) echo "Usage: $0 [--series <path>]"; exit 0;;
    *) echo "Unknown arg: $1" >&2; exit 1;;
  esac
done

fail() { echo "[patch-validate] $*" >&2; exit 1; }
warn() { echo "[patch-validate] warn: $*" >&2; }
info() { echo "[patch-validate] $*" >&2; }

[[ -d "$SERIES" ]] || fail "series directory missing: $SERIES"

CKPT="$SERIES/CHECKPOINT"
[[ -f "$CKPT" ]] || fail "missing CHECKPOINT in $SERIES"

DATE=$(awk -F= '/^DATE=/{print $2}' "$CKPT" | tr -d '\r\n' || true)
COVERS=$(awk -F= '/^COVERS=/{print $2}' "$CKPT" | tr -d '\r\n' || true)
[[ "$DATE" =~ ^[0-9]{8}$ ]] || fail "CHECKPOINT DATE invalid or missing (expected YYYYMMDD), got: '${DATE:-<empty>}'"
[[ "$COVERS" =~ ^[0-9]{4}$ ]] || fail "CHECKPOINT COVERS invalid or missing (expected 4 digits), got: '${COVERS:-<empty>}'"

shopt -s nullglob
cums=("$SERIES"/*-cumulative.patch)
shopt -u nullglob
[[ ${#cums[@]} -gt 0 ]] || fail "no cumulative patch found in $SERIES"

# Prefer the file matching DATE; otherwise accept the lexicographically last.
EXPECT="$SERIES/$DATE-cumulative.patch"
if [[ -f "$EXPECT" ]]; then
  target="$EXPECT"
else
  warn "expected $DATE-cumulative.patch not found; using latest cumulative"
  target=$(ls -1 "$SERIES"/*-cumulative.patch | sort | tail -n1)
fi

# Quick sanity: cumulative patch should start with a diff header
head -n1 "$target" | grep -q '^diff --git ' || fail "cumulative patch $target appears malformed (no diff header)"

# If numbered patches exist, ensure max >= COVERS (COVERS is the last included in checkpoint)
shopt -s nullglob
nums=()
for p in "$SERIES"/00*.patch; do
  [[ -f "$p" ]] || continue
  base=$(basename "$p")
  num=$(printf "%s" "$base" | sed -E 's/^([0-9]{4}).*/\1/')
  [[ "$num" =~ ^[0-9]{4}$ ]] && nums+=("$num")
done
shopt -u nullglob
if [[ ${#nums[@]} -gt 0 ]]; then
  IFS=$'\n' nums_sorted=($(sort <<<"${nums[*]}")); unset IFS
  max_num=${nums_sorted[-1]}
  if (( 10#$max_num < 10#$COVERS )); then
    fail "CHECKPOINT COVERS=$COVERS exceeds highest numbered patch ($max_num)"
  fi
fi

info "series ok: $SERIES (DATE=$DATE, COVERS=$COVERS, cumulative=$(basename "$target"))"
exit 0

