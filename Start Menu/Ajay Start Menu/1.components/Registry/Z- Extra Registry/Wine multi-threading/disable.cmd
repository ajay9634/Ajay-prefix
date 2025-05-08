@echo off
echo Disabling UseXRandR in Wine...

reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "UseXRandR" /t REG_SZ /d "disabled" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "UseXRandR" /t REG_SZ /d "disabled" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo UseXRandR has been disabled successfully in Wine.
exit