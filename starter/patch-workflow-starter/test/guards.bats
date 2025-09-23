#!/usr/bin/env bash

load '../tooling/bats-support/load'
load '../tooling/bats-assert/load'

setup() {
  ROOT_DIR="$BATS_TEST_DIRNAME/.."
  TEST_ROOT="$ROOT_DIR/target/bats-tests/guards"
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
}

copy_pre_commit() {
  mkdir -p .githooks
  cp "$ROOT_DIR/.githooks/pre-commit" .githooks/
  chmod +x .githooks/pre-commit
}

copy_pre_push() {
  mkdir -p .githooks script script/lib
  cp "$ROOT_DIR/.githooks/pre-push" .githooks/
  cp "$ROOT_DIR/script/validate-patch-setup.sh" script/
  cp "$ROOT_DIR/script/lib/sanitize.sh" script/lib/
  chmod +x .githooks/pre-push script/validate-patch-setup.sh
}

@test 'pre-commit blocks primary repo commits' {
  init_repo pre-commit-block
  copy_pre_commit
  run ./.githooks/pre-commit
  assert_failure
  assert_output --partial 'primary working tree'
}

@test 'pre-commit allows with ALLOW_ROOT_COMMIT=1' {
  init_repo pre-commit-allow
  copy_pre_commit
  run env ALLOW_ROOT_COMMIT=1 ./.githooks/pre-commit
  assert_success
}

@test 'pre-push respects PATCH_SERIES override' {
  init_repo pre-push-custom
  copy_pre_push
  mkdir -p custom-series
  cat > custom-series/CHECKPOINT <<EOF
DATE=20250101
COVERS=0000
EOF
  echo 'diff --git a/X b/X' > custom-series/20250101-cumulative.patch
  run env PATCH_SERIES=custom-series ./.githooks/pre-push <<<'refs/heads/main HEAD refs/heads/main 0000000000000000000000000000000000000000'
  assert_success
}

@test 'pre-push fails when PATCH_SERIES override missing' {
  init_repo pre-push-missing
  copy_pre_push
  run env PATCH_SERIES=missing-series ./.githooks/pre-push <<<'refs/heads/main HEAD refs/heads/main 0000000000000000000000000000000000000000'
  assert_failure
  assert_output --partial 'series directory missing'
}
