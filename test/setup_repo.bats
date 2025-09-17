#!/usr/bin/env bash

load '../tooling/bats-support/load'
load '../tooling/bats-assert/load'

setup() {
  ROOT_DIR="$BATS_TEST_DIRNAME/.."
  TEST_ROOT="$ROOT_DIR/target/bats-tests/setup"
  rm -rf "$TEST_ROOT"; mkdir -p "$TEST_ROOT"; cd "$TEST_ROOT"; git init -q
  git config user.email a@b; git config user.name t
  echo t > README.md; git add README.md; git commit -qm init
  mkdir -p script; cp "$ROOT_DIR/script/setup-repo.sh" script/
  cp -r "$ROOT_DIR/.githooks" .
  chmod +x script/setup-repo.sh .githooks/*
}

@test 'setup-repo installs hooksPath and aliases' {
  run script/setup-repo.sh --no-fetch
  assert_success
  run git config --local --get core.hooksPath
  assert_success
  assert_output '.githooks'
  run git config --local --get alias.wtn
  assert_success
  assert_output --partial 'new-worktree.sh'
}
