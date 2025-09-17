#!/usr/bin/env bash

load '../tooling/bats-support/load'
load '../tooling/bats-assert/load'

setup() {
  ROOT_DIR="$BATS_TEST_DIRNAME/.."
  TEST_ROOT="$ROOT_DIR/target/bats-tests/prepush"
  rm -rf "$TEST_ROOT"; mkdir -p "$TEST_ROOT"; cd "$TEST_ROOT"; git init -q
  mkdir -p .githooks script .reapply-patches/macOS-modernization
  cp "$ROOT_DIR/.githooks/pre-push" .githooks/
  cp "$ROOT_DIR/script/validate-patch-setup.sh" script/
  chmod +x .githooks/pre-push script/validate-patch-setup.sh
  git config core.hooksPath .githooks
  git config user.email a@b; git config user.name t; git config commit.gpgsign false
  echo t > README.md; git add README.md; git commit -qm init
  # seed remote base so README.md is not considered a new change
  mkdir -p origin.git; git init -q --bare origin.git; git remote add origin "$PWD/origin.git"; ALLOW_PRE_PUSH_BYPASS=1 ALLOW_MAIN_CODE_PUSH=1 git push origin HEAD:main >/dev/null
  # minimal valid series
  cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0000
EOF
  echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
}

@test 'pre-push allows workflow-only change on main' {
  git add .reapply-patches; git commit -qm workflow
  local_ref="refs/heads/main"; local_sha=$(git rev-parse HEAD); remote_ref="refs/heads/main"; remote_sha=$(printf '0%.0s' {1..40})
  run env PATCH_SERIES=.reapply-patches/macOS-modernization "$PWD/.githooks/pre-push" <<<"$local_ref $local_sha $remote_ref $remote_sha"
  assert_success
}

@test 'pre-push blocks non-workflow change on main' {
  echo hi > random.txt; git add random.txt; git commit -qm change
  local_ref="refs/heads/main"; local_sha=$(git rev-parse HEAD); remote_ref="refs/heads/main"; remote_sha=$(printf '0%.0s' {1..40})
  run env PATCH_SERIES=.reapply-patches/macOS-modernization "$PWD/.githooks/pre-push" <<<"$local_ref $local_sha $remote_ref $remote_sha"
  assert_failure
  assert_output --partial 'Refuses to push non-workflow changes'
}

@test 'pre-push tolerates CRLF and ZWSP in ref input' {
  git add .reapply-patches; git commit -qm wf
  local_ref=$'refs/heads/main\r'; local_sha=$(git rev-parse HEAD); remote_ref=$'refs/heads/main\xE2\x80\x8B'; remote_sha=$(printf '0%.0s' {1..40})
  run env PATCH_SERIES=.reapply-patches/macOS-modernization "$PWD/.githooks/pre-push" <<<"$local_ref $local_sha $remote_ref $remote_sha"
  assert_success
}
