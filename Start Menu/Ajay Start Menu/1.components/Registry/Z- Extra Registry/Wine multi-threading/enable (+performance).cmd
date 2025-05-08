@echo off
echo Enabling UseXRandR in Wine...

reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "UseXRandR" /t REG_SZ /d "enabled" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "UseXRandR" /t REG_SZ /d "enabled" /f >nul 2>&1

timeout.exe /t 4 /nobreak >nul 2>&1
echo UseXRandR has been enabled successfully in Wine.
exit