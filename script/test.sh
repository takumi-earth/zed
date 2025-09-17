#!/usr/bin/env bash
set -euo pipefail

# Run bats tests; optional kcov coverage if present.
# Agentic hint: first run will fetch bats libs via bootstrap-tests.sh.

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

script/bootstrap-tests.sh

export BATS_LIB_PATH="$ROOT_DIR/tooling/bats-support:$ROOT_DIR/tooling/bats-assert"
BATS="$ROOT_DIR/tooling/bats-core/bin/bats"

if command -v kcov >/dev/null 2>&1; then
  out="$ROOT_DIR/target/kcov"
  mkdir -p "$out"
  # Include our scripts for coverage; exclude system dirs
  kcov --include-path="$ROOT_DIR/script" --exclude-pattern=/usr/,/bin/,/opt/ "$out" "$BATS" --tap test
  echo "Coverage output: $out"
else
  "$BATS" --tap test
fi

