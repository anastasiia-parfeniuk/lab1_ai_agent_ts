---
name: create-actions
description: Creates a GitHub Actions CI workflow for three operating systems.
---

# Command: create-actions

Apply the `github-actions` skill.

Check that `ci.sh` and `ci.bat` exist, then create or safely update `.github/workflows/ci.yml`.

The workflow must include a matrix for Ubuntu, Windows, and macOS, run on `push` and `pull_request` events, and invoke the appropriate CI script for each operating system.

Do not include or expose secrets.

After making changes, validate the YAML syntax and explain that the remote workflow execution must be verified on GitHub.