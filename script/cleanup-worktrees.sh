#!/usr/bin/env bash
set -euo pipefail

# Clean up stale/prunable worktrees and empty benchmark directories.

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

echo "=== git worktree prune -v ==="
git worktree prune -v || true

echo "=== Removing empty target/bench-* directories ==="
shopt -s nullglob
for d in "$ROOT_DIR"/target/bench-*; do
  if [[ -d "$d" && -z "$(ls -A "$d" 2>/dev/null || true)" ]]; then
    rm -rf "$d"
    echo "Removed empty: $d"
  fi
done
shopt -u nullglob

echo "Done."

