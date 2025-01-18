@echo off
echo Disabling Wine virtual desktop...

reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "Desktop" /t REG_SZ /d "disabled" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine\X11 Driver" /v "Desktop" /t REG_SZ /d "disabled" /f >nul 2>&1
echo Virtual desktop has been disabled successfully.
exit