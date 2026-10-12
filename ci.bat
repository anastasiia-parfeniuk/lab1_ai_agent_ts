@echo off
setlocal
echo == Build TypeScript project ==
call npm run build
if errorlevel 1 exit /b %errorlevel%

echo == Run unit tests ==
call npm test
if errorlevel 1 exit /b %errorlevel%

echo == Verify runnable Hello World output ==
node dist\hello.js
if errorlevel 1 exit /b %errorlevel%

echo CI checks completed successfully.
exit /b 0
