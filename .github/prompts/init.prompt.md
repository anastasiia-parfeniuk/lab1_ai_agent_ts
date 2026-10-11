---
name: init
description: Orchestrates the complete project creation and validation workflow.
---

# Command: init (orchestrator)

Execute the steps strictly in sequence. After each step, verify the result. If any step returns `FAIL`, stop, explain the cause, and do not proceed to the next step.

1. Invoke `git-init`.
2. Invoke `create-project`.
3. Invoke `create-build`.
4. Invoke `create-actions`.
5. Invoke `check`.
6. Provide a summary of the created files, executed commands, validation results, errors, and next steps.

Before each step, verify its prerequisites.

Repeated execution must not duplicate configuration entries or destroy user changes.

Do not automatically run `commit` or `push`, modify branch protection settings, or expose secrets.