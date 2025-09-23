#!/usr/bin/env bash
set -euo pipefail

# Minimal test harness for the patch/worktree workflow scripts and hooks.
# Agentic hint: runs in a temp repo under target/, does not touch this repo.

ROOT_DIR=$(cd -- "$(dirname -- "$0")/.." && pwd)
TEST_ROOT="$ROOT_DIR/target/workflow-tests"
mkdir -p "$TEST_ROOT"

pass=0; fail=0
it() { printf "\n== %s ==\n" "$*"; }
ok() { echo "PASS: $*"; pass=$((pass+1)); }
ng() { echo "FAIL: $*"; fail=$((fail+1)); }

mkrepo() {
  local name="$1"; local dir="$TEST_ROOT/$name"; rm -rf "$dir"; mkdir -p "$dir"; cd "$dir"; git init -q; echo "# t" > README.md; git add README.md; git commit -qm init;
  # copy hooks/scripts minimal set for tests
  mkdir -p .githooks script
  cp "$ROOT_DIR/.githooks/pre-push" .githooks/
  cp "$ROOT_DIR/script/validate-patch-setup.sh" script/
  chmod +x .githooks/pre-push script/validate-patch-setup.sh
  git config core.hooksPath .githooks
}

# 1) validate-patch-setup: OK with valid series
it "validate: OK when series has CHECKPOINT + cumulative"
mkrepo ok-valid
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
if "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization; then ok valid; else ng valid; fi

# 2) validate-patch-setup: FAIL when CHECKPOINT missing
it "validate: FAIL when CHECKPOINT missing"
mkrepo fail-no-ckpt
mkdir -p .reapply-patches/macOS-modernization
touch .reapply-patches/macOS-modernization/20250101-cumulative.patch
if "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization; then ng missing-ckpt; else ok missing-ckpt; fi

# 3) pre-push: allow workflow-only change on main
it "pre-push: allow workflow-only change on main"
mkrepo hook-allow
mkdir -p .reapply-patches/macOS-modernization
cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0000
EOF
echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
git add .reapply-patches
git commit -qm "workflow change"
local_ref="refs/heads/main"; local_sha=$(git rev-parse HEAD); remote_ref="refs/heads/main"; remote_sha=$(printf '0%.0s' {1..40})
if PATCH_SERIES=.reapply-patches/macOS-modernization "$ROOT_DIR/.githooks/pre-push" <<<"$local_ref $local_sha $remote_ref $remote_sha"; then ok allow-main; else ng allow-main; fi

# 4) pre-push: block non-workflow change on main
it "pre-push: block non-workflow change on main"
mkrepo hook-block
mkdir -p .reapply-patches/macOS-modernization
cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0000
EOF
echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
echo hi > random.txt; git add random.txt .reapply-patches; git commit -qm "non-workflow change"
local_ref="refs/heads/main"; local_sha=$(git rev-parse HEAD); remote_ref="refs/heads/main"; remote_sha=$(printf '0%.0s' {1..40})
if PATCH_SERIES=.reapply-patches/macOS-modernization "$ROOT_DIR/.githooks/pre-push" <<<"$local_ref $local_sha $remote_ref $remote_sha"; then ng block-main; else ok block-main; fi

printf "\nSummary: %d passed, %d failed\n" "$pass" "$fail"
exit $((fail==0?0:1))

# 5) validate-patch-setup: FAIL when DATE invalid
it "validate: FAIL when CHECKPOINT DATE invalid"
mkrepo fail-bad-date
mkdir -p .reapply-patches/macOS-modernization
cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=202501
COVERS=0001
EOF
echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
if "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization; then ng bad-date; else ok bad-date; fi

# 6) validate-patch-setup: FAIL when COVERS invalid
it "validate: FAIL when CHECKPOINT COVERS invalid"
mkrepo fail-bad-covers
mkdir -p .reapply-patches/macOS-modernization
cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=XYZ
EOF
echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
if "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization; then ng bad-covers; else ok bad-covers; fi

# 7) validate-patch-setup: FAIL when cumulative header malformed
it "validate: FAIL when cumulative lacks diff header"
mkrepo fail-bad-cumulative
mkdir -p .reapply-patches/macOS-modernization
cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0000
EOF
echo 'hello' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
if "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization; then ng bad-cum; else ok bad-cum; fi

# 8) validate-patch-setup: FAIL when COVERS exceeds highest numbered patch
it "validate: FAIL when COVERS > highest 000X"
mkrepo fail-covers-exceeds
mkdir -p .reapply-patches/macOS-modernization
cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0005
EOF
echo 'diff --git a/X b/X' > .reapply-patches/macOS-modernization/20250101-cumulative.patch
touch .reapply-patches/macOS-modernization/0001-test.patch
if "$ROOT_DIR/script/validate-patch-setup.sh" --series .reapply-patches/macOS-modernization; then ng covers-exceeds; else ok covers-exceeds; fi

# 9) new-worktree-apply-cumulative.sh: creates worktree and applies checkpoint
it "new-worktree-apply-cumulative: applies checkpoint in new worktree"
name=apply-wt; dir="$TEST_ROOT/$name"; rm -rf "$dir"; mkdir -p "$dir"; cd "$dir"; git init -q; echo t > README.md; git add README.md; git commit -qm init;
# fake upstream remote pointing to this repo itself (simulate upstream/main)
git checkout -qb main; git config user.email a@b; git config user.name t
mkdir -p .reapply-patches/macOS-modernization
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
git add .reapply-patches; git commit -qm series
mkdir -p upstream.git; git init -q --bare upstream.git; git remote add upstream "$dir/upstream.git"; git push upstream HEAD:main >/dev/null
# copy scripts
mkdir -p script; cp "$ROOT_DIR/script/new-worktree-apply-cumulative.sh" script/
chmod +x script/new-worktree-apply-cumulative.sh
out=$(script/new-worktree-apply-cumulative.sh); echo "$out"
wt=$(printf "%s\n" "$out" | sed -n 's/^WORKTREE=\(.*\)$/\1/p')
br=$(printf "%s\n" "$out" | sed -n 's/^BRANCH=\(.*\)$/\1/p')
if [[ -n "$wt" && -d "$wt" ]] && git -C "$wt" rev-parse HEAD >/dev/null 2>&1 && [[ -f "$wt/FOO" ]]; then ok apply-wt; else ng apply-wt; fi

# 10) apply-cumulative.sh in-place apply on current repo
it "apply-cumulative: applies checkpoint in current repo"
name=apply-local; dir="$TEST_ROOT/$name"; rm -rf "$dir"; mkdir -p "$dir"; cd "$dir"; git init -q; echo t > README.md; git add README.md; git commit -qm init
mkdir -p .reapply-patches/macOS-modernization
cat > .reapply-patches/macOS-modernization/CHECKPOINT <<EOF
DATE=20250101
COVERS=0000
EOF
cat > .reapply-patches/macOS-modernization/20250101-cumulative.patch <<'EOF'
diff --git a/BAR b/BAR
new file mode 100644
index 0000000000..e69de29bb2
--- /dev/null
+++ b/BAR
EOF
cp "$ROOT_DIR/script/apply-cumulative.sh" script/; chmod +x script/apply-cumulative.sh
script/apply-cumulative.sh
if [[ -f BAR ]]; then ok apply-local; else ng apply-local; fi

printf "\nSummary: %d passed, %d failed\n" "$pass" "$fail"
exit $((fail==0?0:1))
