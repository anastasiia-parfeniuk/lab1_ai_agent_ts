# Setup and Verification Instructions

## 1. Installing Prerequisites

Make sure the following tools are available:

```bash
node --version
npm --version
git --version
```

Node.js 22 LTS is recommended.

## 2. Installing Dependencies

Run the following command from the repository root:

```bash
npm install
```

If `package-lock.json` has not been created yet, run `npm install` and then add the generated `package-lock.json` to Git. The CI workflow uses `npm install`. After the initial installation, commit `package-lock.json` to the repository to ensure reproducible dependency installations.

## 3. Building and Running the Project

```bash
npm run build
npm start
```

Expected output from `npm start`:

```text
Hello, World!
```

## 4. Unit Tests

```bash
npm test
```

The tests verify `BasicAddition` with positive numbers, negative numbers, and zero.

## 5. Full Local CI

Linux/macOS:

```bash
bash ./ci.sh
```

Windows Command Prompt:

```bat
ci.bat
```

The script exits with a non-zero status code if the build or tests fail.

## 6. Running the AI Agent in VS Code

1. Open the project folder in VS Code.
2. Sign in to GitHub Copilot and open Copilot Chat in Agent mode.
3. Select the `Build Engineer` agent if it is available in the agent list.
4. To run the complete workflow, provide the instructions from `.github/prompts/init.prompt.md` to the agent. For individual steps, open the corresponding prompt file.
5. Review the changes in the diff and approve commands only after understanding what they do.
6. After execution, run `npm run build`, `npm test`, and check `git status --short`.

## 7. GitHub Actions

1. Create a GitHub repository and add the project files.
2. Ensure that the branches and triggers meet the instructor's requirements.
3. Push the branch to GitHub using `git push`.
4. Open the **Actions** tab and verify all three jobs.
5. Save the URL of a successful workflow run or take screenshots for the report.

## 8. Branches and Pull Request

Confirm with the instructor whether the final target branch should be `develop` or `master`, as the course instructions mention both names in different sections. Create a feature branch, make separate meaningful commits, and open a Pull Request titled `lab1/finish`.

Do not claim that a Pull Request has been created unless it actually exists.