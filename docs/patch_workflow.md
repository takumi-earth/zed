Patch + Worktree Workflow (Reusable)

Overview

- Goal: maintain a stack of numbered patches and a dated cumulative checkpoint that can be reapplied cleanly onto a fresh upstream base at any time.
- Tooling: Git worktrees, helper scripts, and repo-local aliases.
- Benefit: easy rebase against upstream without conflict storms; repeatable and automatable.

Repo Structure

- `.reapply-patches/macOS-modernization/`
  - `0001-*.patch` … numbered mail-formatted patches applied with `git am -3`.
  - `YYYYMMDD-cumulative.patch` (checkpoint) … raw diff applied with `git apply --index`.
  - `CHECKPOINT` … metadata indicating the last numbered patch covered by the checkpoint:
    - `DATE=YYYYMMDD`
    - `COVERS=0031`
  - `README.md` … quick guide and project-specific notes.
- `worktrees/` … new worktrees created per branch.
- `script/` … helper scripts (see below).

Helper Scripts

- `script/setup-repo.sh` … idempotent repo setup: hooksPath, aliases, am.threeWay, apply.whitespace=fix, rerere.enabled.
- `script/gstart.sh` … one command: setup → create worktree → apply latest checkpoint → apply deltas beyond checkpoint → push.
- `script/new-worktree.sh` … create a worktree + branch from latest upstream (auto picks newer of main/nightly).
- `script/new-worktree-apply-cumulative.sh` … create worktree, apply checkpoint, then apply numbered deltas based on `CHECKPOINT`; optional `--push`.
- `script/apply-cumulative.sh` … apply checkpoint (and deltas) in current repo (non-worktree).
- `script/cleanup-worktrees.sh` … prune stale worktrees and remove empty `target/bench-*` dirs.
- `script/bench-macos.sh` … benchmark baseline vs patched builds (macOS, optional release build, worktree-aware).
- `script/normalize-cumulative.sh` … sanitize cumulative patch files (trim trailing spaces; avoid structural changes).

Aliases (repo-local)

- `git sts` → `script/setup-repo.sh`
- `git gstart` → `script/gstart.sh`
- `git wtn <name>` → `script/new-worktree.sh --branch <name>`
- `git wta [flags]` → `script/new-worktree-apply-cumulative.sh`
- `git gta` → `script/new-worktree-apply-cumulative.sh --push`
- `git wtl` → `git worktree list -v`
- `git wtr` → `script/cleanup-worktrees.sh`

Pre-push Validation

- The repo includes a pre-push hook (`.githooks/pre-push`) that enforces a valid patch series before pushing.
- It runs `script/validate-patch-setup.sh` to ensure:
  - the series directory exists (default `.reapply-patches/macOS-modernization`),
  - a `CHECKPOINT` file is present and well-formed (`DATE=YYYYMMDD`, `COVERS=NNNN`),
  - at least one `YYYYMMDD-cumulative.patch` exists and looks valid,
  - if numbered patches exist, the highest number is ≥ `COVERS`.
- Override/advanced:
  - Use `PATCH_SERIES=/path/to/series git push` to validate a different series.
  - Bypass (rare): `ALLOW_PRE_PUSH_BYPASS=1 git push`.

Typical Flows

- Fresh session, defaults end-to-end:
  - `git gstart`
  - Then: `cd worktrees/<branch>` and run your builds/tests.

- Fresh session, no immediate push:
  - `git wta` (applies checkpoint + deltas into a new worktree; push later).

- Manual apply in current repo:
  - `script/apply-cumulative.sh --patch .reapply-patches/.../YYYYMMDD-cumulative.patch`

- Create a feature worktree without patches:
  - `git wtn feature-x`

Generating New Deltas and Checkpoints

- After you’ve committed changes on a feature branch/worktree:
  - Export mail-formatted patches: `git format-patch -N -o .reapply-patches/<series> <base>..HEAD`
  - Rename to next `000X-...` and commit them to the patch dir.
  - Update `CHECKPOINT` only when cutting a new cumulative.
- New cumulative checkpoint (from series tip):
  - `git diff upstream/main..HEAD -- . ':(exclude).reapply-patches/**' > .reapply-patches/<series>/YYYYMMDD-cumulative.patch`
  - Trim trailing whitespace: `script/normalize-cumulative.sh <file>`
  - Commit the cumulative and update README + CHECKPOINT.

Apply Semantics

- Checkpoint (raw diff): `git apply --index` (scripts prefer direct apply with whitespace fix; 3-way fallback when needed).
- Numbered patches (mail format): `git am -3 000*.patch`.
- Deltas beyond checkpoint: scripts automatically apply 000*.patch with numbers greater than `CHECKPOINT.COVERS`.

Warnings and What’s OK

- `new blank line at EOF` during apply: benign (intentional final newline). We don’t remove legitimate blank lines; we only trim trailing spaces.
- Fallbacks in logs: the scripts prefer direct apply when `--check` passes; they only emit 3-way fallback when truly necessary.

Worktree Structure

- Worktrees live under `worktrees/<branch>` and are linked to local branches.
- Don’t commit in the primary working tree (root); a pre-commit hook blocks it by default.
- Use `git wtl` to list worktrees and `git wtr` to clean stale ones.

Porting This Workflow

- Copy the `script/` helpers and `.githooks/pre-commit` to new repos; run `script/setup-repo.sh` to install aliases and hooks.
- Create a `.reapply-patches/<series>/` folder with `README.md`, numbered patches, a `CHECKPOINT` file, and a `YYYYMMDD-cumulative.patch`.
- Update series names and script messages as needed.
