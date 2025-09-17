#!/usr/bin/env bash

load 'bats-support/load'
load 'bats-assert/load'

setup() {
  ROOT_DIR="$BATS_TEST_DIRNAME/.."
  TEST_ROOT="$ROOT_DIR/target/bats-tests/apply"
  rm -rf "$TEST_ROOT"; mkdir -p "$TEST_ROOT"; cd "$TEST_ROOT"; git init -q
  git config user.email a@b; git config user.name t
  echo t > README.md; git add README.md; git commit -qm init
  mkdir -p .reapply-patches/macOS-modernization script
  cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0000
EOF
  cat > .reapply-patches/macOS-modernization/20250101-cumulative.patch <<'EOF'
diff --git a/FOO b/FOO
new file mode 100644
index 0000000000..e69de29bb2
--- /dev/null
+++ b/FOO
EOF
  cp "$ROOT_DIR/script/apply-cumulative.sh" script/
  cp "$ROOT_DIR/script/new-worktree-apply-cumulative.sh" script/
  chmod +x script/*.sh
}

@test 'apply-cumulative applies in place' {
  run script/apply-cumulative.sh
  assert_success
  [ -f FOO ]
}

@test 'new-worktree-apply-cumulative creates worktree and applies' {
  # create a fake upstream bare and set as upstream
  mkdir -p upstream.git; git init -q --bare upstream.git
  git remote add upstream "$PWD/upstream.git"
  git push upstream HEAD:main >/dev/null
  run script/new-worktree-apply-cumulative.sh
  assert_success
  WT=$(printf '%s' "$output" | sed -n 's/^WORKTREE=\(.*\)$/\1/p')
  [ -n "$WT" ] && [ -d "$WT" ] && [ -f "$WT/FOO" ]
}

