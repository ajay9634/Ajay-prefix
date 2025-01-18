@echo off
echo Enabling VSync in Wine's Direct3D...
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VSync" /t REG_SZ /d "enabled" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VSync" /t REG_SZ /d "enabled" /f >nul 2>&1
echo VSync setting has been enabled successfully.
exit