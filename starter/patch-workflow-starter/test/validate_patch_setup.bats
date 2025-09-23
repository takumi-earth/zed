#!/usr/bin/env bash

load '../tooling/bats-support/load'
load '../tooling/bats-assert/load'

setup() {
  ROOT_DIR="$BATS_TEST_DIRNAME/.."
  TEST_ROOT="$ROOT_DIR/target/bats-tests/validate"
  rm -rf "$TEST_ROOT"; mkdir -p "$TEST_ROOT"; cd "$TEST_ROOT"
}

@test 'validate: OK with valid series' {
  mkdir -p .reapply-patches/macOS-modernization
  cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0001
EOF
  cat > .reapply-patches/macOS-modernization/20250101-cumulative.patch <<'EOF'
diff --git a/FOO b/FOO
new file mode 100644
index 0000000000..e69de29bb2
--- /dev/null
+++ b/FOO
EOF
  run "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization
  assert_success
  assert_output --partial 'series ok'
}

@test 'validate: FAIL when CHECKPOINT missing' {
  mkdir -p .reapply-patches/macOS-modernization
  touch .reapply-patches/macOS-modernization/20250101-cumulative.patch
  run "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization
  assert_failure
  assert_output --partial 'missing CHECKPOINT'
}

@test 'validate: FAIL when DATE invalid' {
  mkdir -p .reapply-patches/macOS-modernization
  cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=202501
COVERS=0001
EOF
  echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
  run "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization
  assert_failure
  assert_output --partial 'DATE invalid'
}

@test 'validate: FAIL when COVERS invalid' {
  mkdir -p .reapply-patches/macOS-modernization
  cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=XYZ
EOF
  echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
  run "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization
  assert_failure
  assert_output --partial 'COVERS invalid'
}

@test 'validate: FAIL when cumulative lacks diff header' {
  mkdir -p .reapply-patches/macOS-modernization
  cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0000
EOF
  echo 'hello' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
  run "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization
  assert_failure
  assert_output --partial 'malformed'
}

@test 'validate: FAIL when COVERS > highest 000X' {
  mkdir -p .reapply-patches/macOS-modernization
  cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0005
EOF
  echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
  touch .reapply-patches/macOS-modernization/0001-test.patch
  run "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization
  assert_failure
  assert_output --partial 'exceeds highest numbered patch'
}

@test 'validate: OK with BOM/ZWSP/NBSP/CRLF in CHECKPOINT' {
  mkdir -p .reapply-patches/macOS-modernization
  # Inject BOM + ZWSP + NBSP and CRLF line endings
  perl -CSDA -e 'print "\x{FEFF}DATE\x{200B}=20250101\r\nCOVERS\x{00A0}=0000\r\n"' > .reapply-patches/macOS-modernization/CHECKPOINT
  echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
  run "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization
  assert_success
  assert_output --partial 'series ok'
}
