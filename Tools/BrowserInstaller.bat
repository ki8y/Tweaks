@echo off
cls
color d && echo Choose a replacement Browser
echo.
echo [1] Google Chrome
echo [2] Firefox
echo [3] Librewolf
echo [4] Brave
echo [5] Supermium
echo [6] Skip
echo.
choice /c 1234569 /n /m ": "
if %errorlevel%==1 (
    set "URL=https://dl.google.com/chrome/install/latest/chrome_installer.exe"
    set "Name=ChromeSetup.exe"
    set "displayName=Google Chrome"
)
if %errorlevel%==2 (
    set "URL=https://download.mozilla.org/?product=firefox-latest&os=win64&lang=de"
    set "Name=Firefox Installer.exe"
    set "displayName=Firefox"
)
if %errorlevel%==3 (
    set "URL=https://gitlab.com/api/v4/projects/44042130/packages/generic/librewolf/137.0.2-1/librewolf-137.0.2-1-windows-x86_64-setup.exe"
    set "Name=librewolf-137.0.2-1-windows-x86_64-setup.exe"
    set "displayName=Librewolf"
)
if %errorlevel%==4 (
    set "URL=https://github.com/brave/brave-browser/releases/download/v1.77.100/BraveBrowserStandaloneSetup.exe"
    set "Name=BraveBrowserStandaloneSetup.exe"
    set "displayName=Brave"
)
if %errorlevel%==5 (
    set "URL=https://github.com/win32ss/supermium/releases/download/v132-r2/supermium_132_64_setup_win10_11.exe"
    set "Name=supermium_132_64_setup_win10_11.exe"
    set "displayName=Supermium"
)
if %errorlevel%==6 echo Okay, skipping. && exit

mkdir "C:\Kon OS\temp" >nul 2>&1
set "Destination=C:\Kon OS\temp"
cls
echo Installing %displayName%...
curl -s -L "%URL%" -o "%Destination%\%Name%"
echo %displayName% installed. Would you like to run the %displayName% installer?
choice /c YN /n /m "[Y] Yes  [N] No: "
cls
if %errorlevel%==1 (
    echo Okay, starting %displayName%...
    start "" "%Destination%\%Name%"
    echo Once you're finished installing %displayName%, press any key to continue.
    pause >nul
) 
if %errorlevel%==2 echo Okay, skipping. && exit

mkdir "C:\Kon OS\temp" >nul 2>&1
set "Destination=C:\Kon OS\temp"
cls
echo Installing %displayName%...
curl -s -L "%URL%" -o "%Destination%\%Name%"
echo %displayName% installed. Would you like to run the %displayName% installer?
choice /c YN /n /m "[Y] Yes  [N] No: "
cls
if %errorlevel%==1 (
    echo Okay, starting %displayName%...
    start "" "%Destination%\%Name%"
    echo Once you're finished installing %displayName%, press any key to continue.
    pause >nul
) 
if %errorlevel%==2 echo Okay, skipping. && exit
