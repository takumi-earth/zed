#!/usr/bin/env bash

load '../tooling/bats-support/load'
load '../tooling/bats-assert/load'

setup() {
  ROOT_DIR="$BATS_TEST_DIRNAME/.."
  TEST_ROOT="$ROOT_DIR/target/bats-tests/apply"
  rm -rf "$TEST_ROOT"
  mkdir -p "$TEST_ROOT"
}

init_repo() {
  local name="$1"
  local dir="$TEST_ROOT/$name"
  rm -rf "$dir"
  mkdir -p "$dir"
  cd "$dir"
  git init -q
  git config user.email a@b
  git config user.name t
  git config commit.gpgsign false
  mkdir -p script script/lib .reapply-patches/macOS-modernization
  cp "$ROOT_DIR/script/apply-cumulative.sh" script/
  cp "$ROOT_DIR/script/new-worktree-apply-cumulative.sh" script/
  cp "$ROOT_DIR/script/lib/sanitize.sh" script/lib/
  chmod +x script/*.sh
  echo base > PLACEHOLDER
  git add PLACEHOLDER
  git commit -qm 'init repo'
}

make_cumulative_add_file() {
  local file="$1"
  local date="20250101"
  cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=$date
COVERS=0000
EOF
  echo "generated" > "$file"
  git add "$file"
  git commit -qm "cumulative add $file"
  git diff HEAD^ HEAD > \
    .reapply-patches/macOS-modernization/${date}-cumulative.patch
  git reset --hard HEAD^ >/dev/null
}

add_line() {
  local file="$1" text="$2"
  printf '%s\n' "$text" >> "$file"
}

@test 'apply-cumulative applies in place' {
  init_repo apply-local
  make_cumulative_add_file FOO
  run script/apply-cumulative.sh
  assert_success
  [ -f FOO ]
}

@test 'new-worktree-apply creates worktree and applies cumulative' {
  init_repo apply-worktree
  make_cumulative_add_file FOO
  mkdir -p upstream.git
  git init -q --bare upstream.git
  git remote add upstream "$PWD/upstream.git"
  git push upstream HEAD:main >/dev/null
  run script/new-worktree-apply-cumulative.sh
  assert_success
  WT=$(printf '%s' "$output" | sed -n 's/^WORKTREE=\(.*\)$/\1/p')
  [ -n "$WT" ] && [ -f "$WT/FOO" ]
}

@test 'new-worktree-apply auto-applies numbered deltas beyond CHECKPOINT' {
  init_repo auto-delta
  make_cumulative_add_file FOO
  # Generate 0001 patch that creates BAR
  echo 'delta' > BAR
  git add BAR
  git commit -qm 'Add BAR'
  git format-patch -1 HEAD --stdout > \
    .reapply-patches/macOS-modernization/0001-add-BAR.patch
  git reset --hard HEAD^ >/dev/null
  mkdir -p upstream.git
  git init -q --bare upstream.git
  git remote add upstream "$PWD/upstream.git"
  git push upstream HEAD:main >/dev/null
  run script/new-worktree-apply-cumulative.sh
  assert_success
  WT=$(printf '%s' "$output" | sed -n 's/^WORKTREE=\(.*\)$/\1/p')
  [ -f "$WT/FOO" ] && [ -f "$WT/BAR" ]
}

@test 'new-worktree-apply uses 3-way fallback for numbered patches' {
  init_repo three-way
  cat > README <<'EOF'
alpha
beta
EOF
  git add README
  git commit -qm base
  make_cumulative_add_file CUMUL
  # Create patch 0001 that adds gamma after beta
  printf 'alpha\nbeta\ngamma\n' > README
  git add README
  git commit -qm 'Add gamma'
  git format-patch -1 HEAD --stdout > \
    .reapply-patches/macOS-modernization/0001-add-gamma.patch
  git reset --hard HEAD^ >/dev/null
  # Upstream modifies beta to beta-upstream
  printf "alpha\nbeta-upstream\n" > README
  git add README
  git commit -qm 'upstream change'
  mkdir -p upstream.git
  git init -q --bare upstream.git
  git remote add upstream "$PWD/upstream.git"
  ALLOW_PRE_PUSH_BYPASS=1 ALLOW_MAIN_CODE_PUSH=1 git push upstream HEAD:main >/dev/null
  run script/new-worktree-apply-cumulative.sh
  assert_success
  WT=$(printf '%s' "$output" | sed -n 's/^WORKTREE=\(.*\)$/\1/p')
  assert_file_contains "$WT/README" 'beta-upstream'
  assert_file_contains "$WT/README" 'gamma'
}

assert_file_contains() {
  local file="$1" needle="$2"
  run grep -F "$needle" "$file"
  assert_success
}
