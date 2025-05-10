@echo off
color 9
echo Enabling old alt+tab switcher...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d 1 /f >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe >nul 2>&1
echo Done! Press any key to close this window.
pause >nul 2>&1
