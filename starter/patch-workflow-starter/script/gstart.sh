#!/usr/bin/env bash
set -euo pipefail

# Idempotent one-shot: ensure repo is configured, then create a new worktree from
# latest upstream base and apply the current cumulative checkpoint, and push.

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

script/setup-repo.sh --no-fetch || true
OUT=$(script/new-worktree-apply-cumulative.sh --push "$@")
echo "$OUT"

WT=$(echo "$OUT" | sed -n 's/^WORKTREE=\(.*\)$/\1/p' | tail -n1)
BR=$(echo "$OUT" | sed -n 's/^BRANCH=\(.*\)$/\1/p' | tail -n1)

echo
echo "=== gstart complete ==="
echo "Branch:   ${BR:-unknown}"
echo "Worktree: ${WT:-unknown}"
if [[ -n "${WT:-}" && -d "$WT" ]]; then
  echo "Next: cd \"$WT\" && codex"
  echo "Then ask the agent to read: README.md, AGENTS.md, and docs/patch_workflow.md"
fi

