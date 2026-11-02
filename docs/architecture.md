# AI Agent Architecture

## Purpose

Build Engineer automates the typical process of creating a TypeScript Hello World project, configuring Vitest, and setting up CI. The agent receives user instructions and file context, analyzes the current state, and proposes or performs changes using GitHub Copilot capabilities in VS Code.

## Components

| Component | File | Responsibility |
|---|---|---|
| Agent manifest | `.github/agents/build-engineer.agent.md` | Role, rules, constraints, and completion criteria |
| Skill | `.github/skills/project-scaffold/SKILL.md` | Initial project structure and Hello World |
| Skill | `.github/skills/build-and-test/SKILL.md` | TypeScript build and Vitest tests |
| Skill | `.github/skills/github-actions/SKILL.md` | CI workflow for three operating systems |
| Command | `.github/prompts/git-init.prompt.md` | Git and `.gitignore` validation |
| Command | `.github/prompts/create-project.prompt.md` | Invokes the project-scaffolding skill |
| Command | `.github/prompts/create-build.prompt.md` | Build and test configuration |
| Command | `.github/prompts/create-actions.prompt.md` | CI configuration |
| Command | `.github/prompts/check.prompt.md` | Validation without intentionally modifying files |
| Orchestrator | `.github/prompts/init.prompt.md` | Executes all stages sequentially |

## Data Flow

1. The user runs the `init` workflow.
2. `git-init` checks Git and ignore rules.
3. `create-project` creates the source files and basic configuration.
4. `create-build` configures TypeScript and Vitest.
5. `create-actions` creates the workflow and CI scripts.
6. `check` validates the project structure, configuration, build, and tests.
7. The orchestrator summarizes the actual results. If an error occurs, the workflow stops.

## Error Handling and Security

- Commands must be safe to rerun and must not overwrite files indiscriminately.
- The orchestrator stops at the first failed stage.
- Secrets must not be stored in the repository.
- `dist/`, `node_modules/`, and `coverage/` are excluded through `.gitignore`.
- The actual GitHub Actions result is verified on GitHub rather than inferred from local test results.

## Limitations

This is an instruction-based agent that operates through GitHub Copilot in VS Code. Markdown prompt files are not a standalone executable orchestrator: the sequence is carried out by the model following the instructions, while the student must review proposed changes and approve commands. The interface behavior may vary depending on the version of Copilot and VS Code.