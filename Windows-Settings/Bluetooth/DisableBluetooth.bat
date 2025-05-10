@echo off
:: Admin check
title Bluetooth disabler
title Please run this as admin!
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    PowerShell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: The actual disabler
for %%D in (
    BTAGService
    bthserv
) do (
    echo Setting %%D to disabled...
    sc config %%D start= disabled >nul 2>&1 && echo [32m%%D set to disabled successfully[39m || echo [31m[ERROR] Failed to change %%D![39m
)
:: After the enabler
cls
echo Bluetooth has been disabled.
echo Press any key to exit.
pause >nul
