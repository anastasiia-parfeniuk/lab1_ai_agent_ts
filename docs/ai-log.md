# AI Interaction Log

> This log records the real interaction with GitHub Copilot (Build Engineer agent) in VS Code
> while completing Lab 1. Prompt wording is reconstructed from the working session; adjust it to
> match your exact Copilot messages if needed. Files, commands, errors, and results below are the
> actual outcomes recorded in the repository and in GitHub Actions. No tokens, passwords, or
> private keys are included.

## Entry 1 — Agent, Skills, Commands and Project Scaffolding

- **Date/time:** 2026-10-11
- **Prompt sent to Copilot:** "Act as the Build Engineer agent. Run the `init` prompt: create the
  agent manifest, the three skills (project-scaffold, build-and-test, github-actions), the six
  command prompts (git-init, create-project, create-build, create-actions, check, init), and a
  minimal cross-platform TypeScript Hello World project with Vitest."
- **Files created/modified:**
  - `.github/agents/build-engineer.agent.md`
  - `.github/skills/project-scaffold/SKILL.md`, `.github/skills/build-and-test/SKILL.md`,
    `.github/skills/github-actions/SKILL.md`
  - `.github/prompts/git-init.prompt.md`, `create-project.prompt.md`, `create-build.prompt.md`,
    `create-actions.prompt.md`, `check.prompt.md`, `init.prompt.md`
  - `src/hello.ts`, `src/math.ts`, `tests/math.test.ts`
  - `package.json`, `tsconfig.json`, `.gitignore`, `README.md`, `ci.sh`, `ci.bat`
- **Validation and result:** Reviewed every generated file against the lab requirements before
  accepting. Committed the agent and project separately:
  `84a02ea Add AI agent instructions and skills`, then
  `09e2558 Add TypeScript project, tests and CI workflow`.
- **Decision:** Kept the agent instructions (manifest + skills + prompts) on `develop` so that
  running the agent reproduces the full project on `feature/lab1-ai-agent`.

## Entry 2 — Build and Tests

- **Prompt sent to Copilot:** "Run `create-build`: configure the `build`, `test`, and `start`
  npm scripts, implement `BasicAddition(a, b)` in `src/math.ts`, and add Vitest tests in
  `tests/math.test.ts` covering positive, negative, and zero cases. Do not weaken tests to pass."
- **Initial error (if any):** None in the local build/test step.
- **Command and actual result:**
  - `npm run build` → compiles cleanly, produces `dist/hello.js` and `dist/math.js`.
  - `npm test` → `vitest run`: **4 passed** (`BasicAddition` suite).
  - `npm start` → prints `Hello, World!`.
- **Decision:** Accepted the generated tests as-is; confirmed `dist/` stays untracked via
  `.gitignore`.

## Entry 3 — GitHub Actions (real error and fix)

- **Prompt sent to Copilot:** "Run `create-actions`: create `.github/workflows/ci.yml` with a
  matrix for ubuntu-latest, windows-latest, macos-latest, triggered on push and pull_request,
  that only invokes `ci.sh` / `ci.bat`."
- **YAML validation / local CI:** `bash ./ci.sh` → build + tests + `node dist/hello.js` →
  "CI checks completed successfully." Workflow invokes the CI scripts only (no inline build).
- **Initial error:** The **first CI run failed** on all three runners at the *Set up Node.js*
  step:
  ```
  ##[error]Dependencies lock file is not found in .../lab1_ai_agent_ts.
  Supported file patterns: package-lock.json, npm-shrinkwrap.json, yarn.lock
  ```
  (GitHub Actions run `38173860151`, failed in ~13s.)
- **Cause of the error:** `actions/setup-node@v4` was configured with `cache: npm`, which
  requires a committed lockfile to key the dependency cache. `package-lock.json` had not been
  committed, so the cache restore step aborted the job before dependencies were installed.
- **Fix applied:** Generated the lockfile with `npm install` and committed it
  (`df6ed02 add npm lockfile`). This satisfied `cache: npm`'s lockfile requirement. (Alternative
  considered: removing `cache: npm` — rejected, because committing the lockfile also gives
  reproducible installs, which the project requires.)
- **GitHub Actions run URL:** https://github.com/anastasiia-parfeniuk/lab1_ai_agent_ts/actions/runs/38227666087
- **Results for Ubuntu / Windows / macOS:** After the fix, all three jobs pass:
  - `Build and test (ubuntu-latest)` ✅
  - `Build and test (windows-latest)` ✅
  - `Build and test (macos-latest)` ✅

## Notes

- Every generated change was reviewed before acceptance; nothing was committed blindly.
- The real failure in Entry 3 demonstrates the agent's safety rule: CI success is only trusted
  after an actual remote run, never inferred from a local pass.
- No tokens, passwords, or private keys were shared with the AI or committed to the repository.
