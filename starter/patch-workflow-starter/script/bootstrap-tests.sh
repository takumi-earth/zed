#!/usr/bin/env bash
set -euo pipefail

# Bootstrap test dependencies (bats-core, bats-assert, bats-support) under tooling/
# Agentic hint: idempotent; re-runs safely. Requires network access for initial clone.

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
TOOLS_DIR="$ROOT_DIR/tooling"
mkdir -p "$TOOLS_DIR"

fetch_repo() {
  local url="$1"; local dest="$2"; local ref="${3:-}";
  if [[ -d "$dest/.git" ]]; then
    git -C "$dest" fetch -q --tags --prune
    [[ -n "$ref" ]] && git -C "$dest" checkout -q "$ref" || true
  else
    git clone -q "$url" "$dest"
    [[ -n "$ref" ]] && git -C "$dest" checkout -q "$ref" || true
  fi
}

# bats-core
if [[ ! -x "$TOOLS_DIR/bats-core/bin/bats" ]]; then
  fetch_repo https://github.com/bats-core/bats-core.git "$TOOLS_DIR/bats-core"
fi

# bats-support
if [[ ! -d "$TOOLS_DIR/bats-support" ]]; then
  fetch_repo https://github.com/bats-core/bats-support.git "$TOOLS_DIR/bats-support"
fi

# bats-assert
if [[ ! -d "$TOOLS_DIR/bats-assert" ]]; then
  fetch_repo https://github.com/bats-core/bats-assert.git "$TOOLS_DIR/bats-assert"
fi

echo "bats-core: $TOOLS_DIR/bats-core"
echo "bats-support: $TOOLS_DIR/bats-support"
echo "bats-assert: $TOOLS_DIR/bats-assert"

