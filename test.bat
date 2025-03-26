@echo off
color c
Title KONS FUCKASS TWEAKS RAHH
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.               ██╗░░██╗░█████╗░███╗░░██╗██╗░██████╗  ████████╗░██╗░░░░░░░██╗███████╗░█████╗░██╗░░██╗░██████╗
echo.               ██║░██╔╝██╔══██╗████╗░██║╚█║██╔════╝  ╚══██╔══╝░██║░░██╗░░██║██╔════╝██╔══██╗██║░██╔╝██╔════╝
echo.               █████═╝░██║░░██║██╔██╗██║░╚╝╚█████╗░  ░░░██║░░░░╚██╗████╗██╔╝█████╗░░███████║█████═╝░╚█████╗░
echo.               ██╔═██╗░██║░░██║██║╚████║░░░░╚═══██╗  ░░░██║░░░░░████╔═████║░██╔══╝░░██╔══██║██╔═██╗░░╚═══██╗
echo.               ██║░╚██╗╚█████╔╝██║░╚███║░░░██████╔╝  ░░░██║░░░░░╚██╔╝░╚██╔╝░███████╗██║░░██║██║░╚██╗██████╔╝
echo.               ╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░░░╚═════╝░  ░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░
echo.
echo.                                  ╔════════════════════════════════════════════════════╗
echo.                                  ║               Prototype 1 - By Kon                 ║
echo.                                  ╚════════════════════════════════════════════════════╝
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
cls
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    powershell -Command "Write-Host 'You need to run this with admin for it to actually work.' -ForegroundColor White -BackgroundColor Red" 
    powershell -Command "Write-Host 'Please press YES to the next prompt so I can rat your PC :)' -ForegroundColor White -BackgroundColor Red" 
    timeout 3 > nul
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)
:AutoEndTasks
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.                                              Enable AutoEndTasks in regedit?
echo.                                  (This automatically closes apps on shutdown preventing
echo.                                        that annoying "Shutdown Anyway?" prompt.)
echo.
echo.                         ╔═════════════════════════════════════════════════════════════════════╗ 
echo.                         ║                                                                     ║ 
echo.                         ║               [1] Yes                        [2] No                 ║
echo.                         ║                                                                     ║                         
echo.                         ║                           [3] More info                             ║
echo.                         ╚═════════════════════════════════════════════════════════════════════╝
echo.  
echo.  
echo.
echo ____________________ 
if "%option%"=="1" (
    cls
    Call :aetYes
) else if "%option%"=="2" (
    cls
    Call :aetNo                       
if "%option%"=="3" (
    cls
    Call :aetInf
) else (
    cls
    chcp 437 >nul
    powershell -Command "Write-Host 'no you gotta pick a number on the list' -ForegroundColor White -BackgroundColor Red"
    powershell -Command "Write-Host 'try again.' -ForegroundColor White -BackgroundColor Red"
    timeout 2 > nul
    goto :AutoEndTasks
)
:aetYes
echo.[Kon's Tweaks] Pretend this worked.
timeout 1 > nul
exit /b 0