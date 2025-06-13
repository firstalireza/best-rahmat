@echo off

net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo Stopping HNS service...
net stop hns

echo Waiting a bit...
timeout /t 2 >nul

echo Starting HNS service...
net start hns

echo Done.
pause
