macOS Modernization Patch Series

Current Checkpoint

- Use `20250925-cumulative.patch` for the latest full checkpoint (includes 0001–0031 + subsequent fixes).
  - Quick apply on fresh `upstream/main`:
    - `git switch -c macOS-modernization-<date> upstream/main`
    - `git apply --index .reapply-patches/macOS-modernization/20250925-cumulative.patch`
    - `git commit -m "macOS: apply 20250924 cumulative checkpoint"`

See docs/patch_workflow.md for a comprehensive, reusable guide.
