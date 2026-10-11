---
name: git-init
description: Checks Git status and .gitignore without making unsafe changes.
---

# Command: git-init

1. Check whether the current directory is inside a Git repository by running `git rev-parse --is-inside-work-tree`.
2. If Git has not been initialized, ask for confirmation before running `git init`. Do not modify the remote configuration automatically.
3. Check `.gitignore`. Add any missing rules for `node_modules/`, `dist/`, `coverage/`, `.env`, `.DS_Store`, and log files without removing existing rules.
4. Run `git status --short --branch`.
5. Explain the results. Do not run `commit`, `push`, or destructive Git commands without an explicit request.