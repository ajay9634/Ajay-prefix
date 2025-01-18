@echo off
echo Enabling Wine virtual desktop and setting resolution to 1280x720...

reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "Desktop" /t REG_SZ /d "enabled" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "DesktopWidth" /t REG_SZ /d "1280" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "DesktopHeight" /t REG_SZ /d "720" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

echo Virtual desktop has been enabled with resolution 1280x720 successfully.
exit