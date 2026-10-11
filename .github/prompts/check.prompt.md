---
name: check
description: Checks the project structure, configuration, build, tests, and CI without modifying project files.
---

# Command: check

This command must perform a validation of the project without intentionally modifying any project files.

1. Check for the existence of the agent manifest, all three skills, all six prompt commands, source files, tests, CI scripts, and the workflow file.
2. Check for the existence of `package.json` and `package-lock.json`, and verify that the required npm scripts are correctly configured.
3. If dependencies are installed, run `npm run build` and `npm test`. Otherwise, report that dependencies must be installed first using `npm ci`.
4. Verify that the workflow includes `ubuntu-latest`, `windows-latest`, `macos-latest`, `push`, and `pull_request`.
5. Run `git status --short` and warn if `dist/`, `node_modules/`, or any secrets are tracked by Git.
6. Report each check as `PASS`, `FAIL`, or `NOT RUN`, providing evidence for each result. If any check fails, do not describe the project as fully validated.