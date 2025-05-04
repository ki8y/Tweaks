@echo off
:: Admin check
title Bluetooth enabler
title Please run this as admin!
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    PowerShell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: The actual enabler
for %%M in (
    BTAGService
    bthserv
) do (
    echo Setting %%M to manual...
    sc config %%M start= demand >nul 2>&1 && echo [32m%%M set to manual successfully[39m || echo [31m[ERROR] Failed to change %%M![39m
)
:: After the enabler
cls
echo Bluetooth has been re-enabled.
echo Press any key to exit.
pause >nul
