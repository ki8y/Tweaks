@echo off
color c
cls && echo Disabling wifi services...
sc config NlaSvc start= disabled
sc config LanmanWorkstation start= disabled
schtasks /Change /TN "Microsoft\Windows\WlanSvc\CDSSync" /Disable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Disable
schtasks /Change /TN "Microsoft\Windows\NlaSvc\WiFiTask" /Disable
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable
reg add "HKLM\Software\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "Value" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "Value" /t REG_DWORD /d 0 /f
sc config BFE start= demand
sc config Dnscache start= demand
sc config WinHttpAutoProxySvc start= demand
sc config Dhcp start= auto
sc config lmhosts start= disabled
sc config nsi start= auto
sc config Wcmsvc start= disabled
sc config Winmgmt start= auto
sc config WlanSvc start= demand
for /f "tokens=1,* delims=:" %%A in ('netsh interface show interface ^| findstr /i "Wireless"') do (
    set "wifiName=%%B"
)
setlocal EnableDelayedExpansion
set "wifiName=!wifiName:~1!"
netsh interface set interface name="!wifiName!" admin=disabled
cls
echo Done. Changes require restart to take effect.
echo.
echo Restart computer?
choice /c YN /n /m "[Y] Yes  [N] No: "
if %errorlevel%==1 shutdown /r -t 0
if %errorlevel%==2 exit
