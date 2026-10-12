#!/usr/bin/env bash
set -euo pipefail
echo "== Build TypeScript project =="
npm run build
echo "== Run unit tests =="
npm test
echo "== Verify runnable Hello World output =="
node dist/hello.js
echo "CI checks completed successfully."
