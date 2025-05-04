@echo off
color a
echo Enabling old alt+tab switcher...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe
start explorer.exe
echo Done! Press any key to close this window.
pause >nul
