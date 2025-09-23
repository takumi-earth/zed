# Patch Workflow Starter

This starter contains hooks, scripts, docs, vendored Bats libraries, and tests
for running the patch workflow outside this repository.

## Usage

1. Copy the contents of this directory into your target repository:
   ```bash
   rsync -av starter/patch-workflow-starter/ /path/to/target-repo/
   ```
2. In the target repo, run once:
   ```bash
   script/setup-repo.sh
   ```
3. Create/get a checkpoint:
   - Place numbered patches under `.reapply-patches/<series>/`.
   - Add a `CHECKPOINT` file (see docs) and a `YYYYMMDD-cumulative.patch`.
4. Start working:
   - `git gstart`  (setup + worktree + apply + push)
   - `git wta` / `git gta` (create/auto-apply w/o or with push)
5. Run tests and coverage:
   ```bash
   script/test.sh
   ```
   If `kcov` is installed, coverage reports appear in `target/kcov`.

Refer to `docs/patch_workflow.md` and `AGENTS.md` for full instructions.
