@echo off
set "file=https://raw.githubusercontent.com/ki8y/Tweaks/main/GPU/Nvidia/2_NIP/nvidiaProfileInspector.exe"
set "name=nvidiaProfileInspector.exe"
mkdir "C:\Kon OS\Display Drivers\NVIDIA\2) Nvidia Profile Inspector"
set "location=C:\Kon OS\Display Drivers\NVIDIA\2) Nvidia Profile Inspector"
curl -s -L "%file%" -o "%location%\%name%"

set "file=https://raw.githubusercontent.com/ki8y/Tweaks/main/GPU/Nvidia/2_NIP/Reference.xml"
set "name=Reference.xml"
curl -s -L "%file%" -o "%location%\%name%"

set "file=https://raw.githubusercontent.com/ki8y/Tweaks/main/GPU/Nvidia/2_NIP/autoimport.bat"
set "name=autoimport.bat"
curl -s -L "%file%" -o "%location%\%name%"

set "file=https://raw.githubusercontent.com/ki8y/Tweaks/main/GPU/Nvidia/2_NIP/inspector.nip"
set "name=inspector.nip"
curl -s -L "%file%" -o "%location%\%name%"

set "file=https://raw.githubusercontent.com/ki8y/Tweaks/main/GPU/Nvidia/2_NIP/nvidiaProfileInspector.exe.config"
set "name=nvidiaProfileInspector.exe.config"
curl -s -L "%file%" -o "%location%\%name%"