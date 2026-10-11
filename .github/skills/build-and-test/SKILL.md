---
name: build-and-test
description: Configures TypeScript compilation and Vitest unit tests.
---

# Skill: build-and-test

## When to Apply

After creating the initial project or whenever the build and tests need to be validated.

## Inputs

- `package.json`
- `tsconfig.json`
- Files in `src/` and `tests/`

## Actions

1. Configure `npm run build` to compile TypeScript into `dist/`.
2. Configure `npm test` to run Vitest in non-watch mode.
3. Add the `BasicAddition(a, b)` function and unit tests covering positive numbers, negative numbers, and zero.
4. Do not hide errors or disable tests to obtain a passing result.

## Expected Outputs

- `src/math.ts`
- `tests/math.test.ts`
- Working `build` and `test` scripts in `package.json`
- The `dist/` directory after a successful build

## Validation

- `npm run build`
- `npm test`
- `npm start`

## Common Issues

- If a test fails, determine whether the implementation, the test, or the configuration is incorrect.
- Do not change the expected test value merely to hide a defect.