#!/usr/bin/env bash
set -euo pipefail

# One-time or per-session setup for worktree-first + patch workflow
# Agentic hint: run this in any new clone before using aliases.
#
# Usage:
#   script/setup-repo.sh [--apply-checkpoint] [--push] [--branch <name>] [--base auto|main|nightly]
#                        [--no-fetch]

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

DO_APPLY=0
DO_PUSH=0
BRANCH_NAME=""
BASE_MODE="auto"
DO_FETCH=1

while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply-checkpoint) DO_APPLY=1; shift;;
    --push) DO_PUSH=1; shift;;
    --branch) BRANCH_NAME="$2"; shift 2;;
    --base) BASE_MODE="$2"; shift 2;;
    --no-fetch) DO_FETCH=0; shift;;
    -h|--help) echo "Usage: $0 [--apply-checkpoint] [--push] [--branch <name>] [--base auto|main|nightly] [--no-fetch]"; exit 0;;
    *) echo "Unknown arg: $1" >&2; exit 1;;
  esac
done

# hooks (ensure repo uses committed hooks)
git config --local core.hooksPath .githooks || true

# patch-friendly git config
git config --local am.threeWay true || true
git config --local apply.whitespace fix || true
git config --local rerere.enabled true || true

# aliases (worktree lifecycle + patch helpers)
git config --local alias.wtn "!script/new-worktree.sh --branch" || true
git config --local alias.wta "!script/new-worktree-apply-cumulative.sh" || true
git config --local alias.gta "!script/new-worktree-apply-cumulative.sh --push" || true
git config --local alias.wtl "!git worktree list -v" || true
git config --local alias.wtr "!script/cleanup-worktrees.sh" || true
git config --local alias.sts "!script/setup-repo.sh" || true
git config --local alias.gstart "!script/gstart.sh" || true

# ensure executables
chmod +x \
  script/new-worktree.sh \
  script/new-worktree-apply-cumulative.sh \
  script/apply-cumulative.sh \
  script/cleanup-worktrees.sh \
  script/bench-macos.sh \
  script/gstart.sh 2>/dev/null || true

if [[ $DO_FETCH -eq 1 ]]; then
  git fetch upstream --tags --prune >/dev/null 2>&1 || true
  git fetch origin --tags --prune >/dev/null 2>&1 || true
fi

if [[ $DO_APPLY -eq 1 ]]; then
  cmd=( script/new-worktree-apply-cumulative.sh --base "$BASE_MODE" )
  [[ -n "$BRANCH_NAME" ]] && cmd+=( --branch "$BRANCH_NAME" )
  [[ $DO_PUSH -eq 1 ]] && cmd+=( --push )
  "${cmd[@]}"
fi

echo "Setup complete."
