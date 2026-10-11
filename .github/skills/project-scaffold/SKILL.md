---
name: project-scaffold
description: Creates the initial structure of a TypeScript Hello World project.
---

# Skill: project-scaffold

## When to Apply

When creating or validating a minimal TypeScript project.

## Inputs

- `projectName`: project name (defaults to `lab1-ai-agent-ts`).
- `language`: TypeScript for Variant 6.

## Actions

1. Inspect existing files and do not overwrite unfamiliar user changes without explaining the proposed modifications.
2. Create `src/hello.ts` to output `Hello, World!`.
3. Create `src/math.ts` containing the `BasicAddition(a, b)` function.
4. Create `package.json`, `tsconfig.json`, `README.md`, and `.gitignore`.
5. Use Node.js and npm; do not add unnecessary dependencies.

## Expected Outputs

- `src/hello.ts`
- `src/math.ts`
- `package.json`
- `tsconfig.json`
- `.gitignore`
- `README.md`

## Validation

- `npm install` or `npm ci` completes successfully.
- `npm run build` generates `dist/hello.js` and `dist/math.js`.
- `npm start` outputs `Hello, World!`.

## Common Issues

- If Node.js/npm is not installed, explain how to install it.
- If a file already exists, inspect it before making changes and agree on the proposed modifications.
- If the build fails, read the TypeScript error and fix the root cause.