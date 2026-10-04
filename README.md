

https://gofile.io/d/j6QNWKUh


https://gofile.io/d/RLTbn2Eb


@echo off
:: بەرزکردنەوەی دەستڕۆیشتوویی بۆ Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
:: جێبەجێکردنی سکریپتی PowerShell
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install_rockstar.ps1"
pause
