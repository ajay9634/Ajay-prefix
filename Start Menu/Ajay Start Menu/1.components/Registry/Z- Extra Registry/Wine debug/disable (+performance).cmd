@echo off
echo Disabling Debug in Wine...

reg add "HKEY_CURRENT_USER\Software\Wine" /v "Debug" /t REG_SZ /d "disabled" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Wine" /v "Debug" /t REG_SZ /d "disabled" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo Debugging has been disabled successfully in Wine.
exit