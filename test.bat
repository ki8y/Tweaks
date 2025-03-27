@echo off
title Please run this as admin!
fltmc >nul 2>&1
if not %errorlevel% == 0 (
echo [97;101mYou need to run this with admin for it to actually work.
echo Write-Host 'Please press YES to the next prompt so I can rat your PC
    timeout 3 > nul 
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)
color c
Title Kon's Tweaks
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
echo                                   ║                                                    ║
echo.                                  ╚════════════════════════════════════════════════════╝
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
timeout 3 > nul
cls

:: Restore point!!!
:RestorePoint
title Restore points! (You really SHOULD make one.)
chcp 437 >nul
color 6
echo [KT] I highly recommend you create a restore point before applying these tweaks.
echo This can save you from a huge headache if you encounter potential issues.
echo.
echo Create a restore point?
:: Use 'choice' for cleaner input handling
choice /c YN /n /m "[Y] Yes  [N] No: "
if %errorlevel%==1 goto CreateRestorePoint
if %errorlevel%==2 goto SkipRestorePoint

:: Invalid input handling (not needed with choice, but can be kept for extra safety)
cls
color 4
echo [Error] Invalid input. Please enter Y or N.
timeout /t 3 >nul
goto RestorePoint

:CreateRestorePoint
cls
echo Creating your restore point...
:: Remove restore point creation frequency limit
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul
:: Create System Restore Point
powershell -Command "Checkpoint-Computer -Description 'Pre-KT Restore Point'"
echo [KT] Restore point created!
echo If needed, it's named: "Pre-KT Restore Point".
timeout /t 3 >nul
goto AutoEndTasks

:SkipRestorePoint
cls
echo [KT] Not creating a restore point.
echo **Use at your own risk!!! I am not responsible for any harm done to your computer!**
timeout /t 3 >nul
goto AutoEndTasks


:AutoEndTasks
cls
echo [Kon] Loading...
chcp 65001 >nul 2>&1
color a
title Shutdown Tweaks
cls
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
echo.                                           Enable Shutdown tweaks in regedit?
echo.                                  (This automatically closes apps on shutdown preventing
echo.                                        that annoying "Shutdown Anyway?" prompt.)
echo.
echo.                         ╔═════════════════════════════════════════════════════════════════════╗
echo.                         ║                                                                     ║
echo.                         ║               [1] Yes                        [2] No                 ║
echo.                         ║                           [3] More info                             ║
echo.                         ║                                                                     ║
echo.                         ╚═════════════════════════════════════════════════════════════════════╝
echo.                         🛈 No if unsure.
echo.
echo.
echo.
echo _____________________________________________
set /p option="Enter option number: "
if "%option%"=="1" (
    cls
    goto aetYes
) else if "%option%"=="2" (
    cls
    goto aetNo
) else if "%option%"=="3" (
    cls
    call :aetInf
    ) else if "%option%"=="debug" (
    cls
    goto AppInstaller
) else (
    cls
    chcp 437 >nul
    color 4
    title Error!
    powershell -Command "Write-Host 'You have to choose a valid number on the screen. Please try again.' -ForegroundColor White -BackgroundColor Red"
    echo Proceeding in 3 seconds. Press any key to skip.
    timeout 3 > nul
    goto :AutoEndTasks
)

::When the user presses option 1.
:aetYes
chcp 437 >nul
echo [KT] Okay, applying shutdown tweaks to registry.
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout /t REG_SZ" /d "1000" /f
echo [KT] Done!
timeout 2 >nul
goto Ending

:: When the user presses option 2.
:aetNo
chcp 437 >nul
echo [KT] Okay, NOT adding shutdown tweaks to registry.
timeout 2 > nul
goto Ending

:: When the user presses option 3.
:aetInf
color f
echo The following registry changes will be applied:
echo.
echo  HKEY_CURRENT_USER\Control Panel\Desktop
echo    - Name: [96m"AutoEndTasks"[0m          Value: [33m"1"
echo    [0m- Name: [96m"WaitToKillAppTimeout"[0m  Value: [33m"2000"
echo    [0m- Name: [96m"HungAppTimeout"[0m        Value: [33m"1000"
echo. [0m
pause
goto AutoEndTasks

:Ending
cls
Echo Dats all I have in this thing so far. I'll add more later. Bye for now
pause >nul
exit

::AppInstaller (UNUSED, VERY BROKEN)
::@echo off
::title App Installer
::cls
::chcp 65001 >nul 2>&1
::echo.
::echo.
::echo.         
::echo.
::echo.
::echo.
::echo.
::echo.
::echo.            █████╗ ██████╗ ██████╗     ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
::echo.           ██╔══██╗██╔══██╗██╔══██╗    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
::echo.           ███████║██████╔╝██████╔╝    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
::echo.           ██╔══██║██╔═══╝ ██╔═══╝     ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
::echo.           ██║  ██║██║     ██║         ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
::echo.           ╚═╝  ╚═╝╚═╝     ╚═╝         ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
::echo.                                                                                                                                              
::echo.                         ╔═════════════════════════════════════════════════════════════════════╗
::echo.                         ║                                                                     ║
::echo.                         ║     [1] Google Chrome                           [2] Everything      ║
::echo.                         ║                                                                     ║
::echo.                         ║     [3] Spotify                                 [4] Notepad++       ║
::echo.                         ║                                                                     ║
::echo.                         ║                            [0] Return                               ║
::echo.                         ║                                                                     ║
::echo.                         ╚═════════════════════════════════════════════════════════════════════╝
::echo.
::echo.
::echo _____________________________________________
::set /p option="Enter option number: "
::::Chrome Download
::if "%option%"=="1" (
::    set "fileURL=https://dl.google.com/chrome/install/latest/chrome_installer.exe"
::    set "fileName=ChromeSetup.exe"
::::Everything Download
::) else if "%option%"=="2" (
::    set "fileURL=https://www.voidtools.com/Everything-1.4.1.1026.x64-Setup.exe"
::    set "fileName=EverythingSetup.exe"
::::Spotify Download
::) else if "%option%"=="3" (
::    set "fileURL=https://download.scdn.co/SpotifySetup.exe"
::    set "fileName=SpotifySetup.exe"
::::Spotify Download
::) else if "%option%"=="4" (
::    set "fileURL=https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.8/npp.8.7.8.Installer.x64.exe"
::    set "fileName=NPPInstaller"
::) else (
::    cls
::    chcp 437 >nul
::    color 4
::    title Error!
::    powershell -Command "Write-Host 'You have to choose a valid number on the screen. Please try again.' -ForegroundColor White -BackgroundColor Red"
::    echo Proceeding in 3 seconds. Press any key to skip.
::    timeout 3 > nul
::    goto :AutoEndTasks
::)
:CTT
cls
chcp 437 >nul
echo
