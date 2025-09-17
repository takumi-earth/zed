#!/usr/bin/env bash
set -euo pipefail

# macOS benchmark: baseline vs patched (checkpoint)
# Usage: script/bench-macos.sh [--mode both|baseline|patched] [--patch <path>] [--skip-release] [--no-clean]

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

PATCH_DIR=".reapply-patches/macOS-modernization"
LATEST_CUM_PATCH=""
if ls -1 "$PATCH_DIR"/*-cumulative.patch >/dev/null 2>&1; then
  LATEST_CUM_PATCH=$(ls -1 "$PATCH_DIR"/*-cumulative.patch | sort | tail -n1)
fi

PATCH_PATH="${LATEST_CUM_PATCH:-}"
MODE="both"
SKIP_RELEASE=0
CLEAN_BUILD=1
TARGET_CRATE="zed"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode) MODE="$2"; shift 2;;
    --patch) PATCH_PATH="$2"; shift 2;;
    --skip-release) SKIP_RELEASE=1; shift;;
    --no-clean) CLEAN_BUILD=0; shift;;
    --crate) TARGET_CRATE="$2"; shift 2;;
    -h|--help) echo "Usage: $0 [--mode both|baseline|patched] [--patch <path>] [--skip-release] [--no-clean] [--crate <name>]"; exit 0;;
    *) echo "Unknown arg: $1" >&2; exit 1;;
  esac
done

if [[ "$MODE" != "baseline" ]]; then
  if [[ -z "$PATCH_PATH" || ! -f "$PATCH_PATH" ]]; then
    echo "Cumulative patch not found. Specify with --patch or ensure one exists in $PATCH_DIR" >&2
    exit 1
  fi
fi

timestamp() { date +"%Y-%m-%d %H:%M:%S"; }
measure() { local l=$1; shift; local s=$(date +%s); "$@"; local r=$?; local e=$(date +%s); echo "[$(timestamp)] $l -> $((e-s))s (status $r)" >&2; echo $((e-s)); }

RUN_ID=$(date +%Y%m%d-%H%M%S)
WORKTREES_BASE="$ROOT_DIR/target/bench-$RUN_ID"
BASELINE_DIR="$WORKTREES_BASE/baseline"
PATCHED_DIR="$WORKTREES_BASE/patched"
mkdir -p "$WORKTREES_BASE"

git fetch upstream --tags --prune >/dev/null 2>&1 || true

git worktree add "$BASELINE_DIR" upstream/main >/dev/null
if [[ "$MODE" != "baseline" ]]; then git worktree add "$PATCHED_DIR" upstream/main >/dev/null; fi

BASE_CHECK="skipped"; BASE_BUILD="skipped"
if [[ "$MODE" != "patched" ]]; then
  pushd "$BASELINE_DIR" >/dev/null
  [[ $CLEAN_BUILD -eq 1 ]] && cargo clean || true
  BASE_CHECK=$(measure "baseline: cargo check -p gpui" bash -lc "cargo check -p gpui")
  if [[ $SKIP_RELEASE -eq 0 ]]; then BASE_BUILD=$(measure "baseline: cargo build -p $TARGET_CRATE --release" bash -lc "cargo build -p $TARGET_CRATE --release"); fi
  popd >/dev/null
fi

PAT_CHECK="skipped"; PAT_BUILD="skipped"
if [[ "$MODE" != "baseline" ]]; then
  pushd "$PATCHED_DIR" >/dev/null
  if git apply --check "$ROOT_DIR/$PATCH_PATH" >/dev/null 2>&1; then
    git apply --index --whitespace=fix "$ROOT_DIR/$PATCH_PATH"
  else
    git apply --3way --index --whitespace=fix "$ROOT_DIR/$PATCH_PATH"
  fi
  git commit -m "bench: apply $(basename "$PATCH_PATH")" >/dev/null
  [[ $CLEAN_BUILD -eq 1 ]] && cargo clean || true
  PAT_CHECK=$(measure "patched: cargo check -p gpui" bash -lc "cargo check -p gpui")
  if [[ $SKIP_RELEASE -eq 0 ]]; then PAT_BUILD=$(measure "patched: cargo build -p $TARGET_CRATE --release" bash -lc "cargo build -p $TARGET_CRATE --release"); fi
  popd >/dev/null
fi

echo "Baseline check: $BASE_CHECK s"
echo "Baseline build: $BASE_BUILD s"
echo "Patched check:  $PAT_CHECK s"
echo "Patched build:  $PAT_BUILD s"

