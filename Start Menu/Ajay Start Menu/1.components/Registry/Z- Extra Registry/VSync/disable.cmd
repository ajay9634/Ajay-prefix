@echo off
echo Disabling VSync in Wine's Direct3D...
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VSync" /t REG_SZ /d "disabled" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VSync" /t REG_SZ /d "disabled" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo VSync setting has been disabled successfully.
exit