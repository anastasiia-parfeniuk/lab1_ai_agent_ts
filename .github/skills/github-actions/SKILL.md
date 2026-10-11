---
name: github-actions
description: Creates a cross-platform GitHub Actions workflow for building and testing the project.
---

# Skill: github-actions

## When to Apply

After creating the project and local CI scripts.

## Inputs

- `ci.sh`
- `ci.bat`
- `package.json` and `package-lock.json`

## Actions

1. Create `.github/workflows/ci.yml`.
2. Use a single job with a matrix containing `ubuntu-latest`, `windows-latest`, and `macos-latest`.
3. Run the workflow on `push` and `pull_request` events for `develop`, `master`, and `feature/**` branches.
4. Check out the repository, set up the Node.js LTS version, and install dependencies.
5. Invoke `bash ./ci.sh` on Linux/macOS and `cmd /c ci.bat` on Windows. The scripts must run the build and tests and generate `dist/hello.js`.
6. Do not add secrets to the YAML file or repository.

## Expected Outputs

- `.github/workflows/ci.yml`
- `ci.sh`
- `ci.bat`

## Validation

- Validate the YAML syntax using an available local tool or by reviewing the file.
- Ensure that the workflow includes all three operating systems.
- Run the appropriate CI script locally.
- After pushing, verify the actual result on the GitHub Actions tab.

## Common Issues

- If the Windows command fails to run, check the `cmd` syntax and the path to `ci.bat`.
- If the job does not start, check the branch names, YAML indentation, and workflow file.
- Do not report GitHub Actions as successful until an actual successful run is available.