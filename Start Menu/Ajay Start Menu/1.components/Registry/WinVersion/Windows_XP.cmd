@echo off
echo Setting Wine version to winxp...
reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "winxp" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "winxp" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo Wine version has been set to winxp successfully.
exit