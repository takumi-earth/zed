Agent Setup and Patch Workflow

Overview

- This repository includes a reusable workflow for managing patch series and reapplying them cleanly on top of upstream.
- Use Git worktrees plus helper scripts to automate creation of fresh branches, application of a cumulative checkpoint, and any numbered delta patches, with optional push.

Quick Start

- One-shot startup (setup + worktree + apply + push):
  - `git gstart`
- Manual setup then apply:
  - `git sts` (configure hooks, aliases, and git settings for this repo)
  - `git wta` (create worktree, apply latest checkpoint + deltas; push later) or `git gta` (same + push)

Documentation

- See `docs/patch_workflow.md` for a comprehensive guide covering:
  - Repo layout (patch series folder, checkpoint metadata)
  - Helper scripts and what they do
  - Aliases and common flows
  - How to generate new deltas and checkpoints
  - Worktree hygiene and porting this setup to other repos
  - Pre-push safeguards (CHECKPOINT + cumulative required; main protected to workflow-only changes)
  - Testing (`script/test.sh`) and coverage hints (`kcov` support, offline vendored bats libraries)
