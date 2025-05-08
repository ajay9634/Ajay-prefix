@echo off
echo Setting VideoMemorySize to 4096 in Wine's Direct3D...
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VideoMemorySize" /t REG_SZ /d "4096" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VideoMemorySize" /t REG_SZ /d "4096" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo VideoMemorySize setting has been set to 4096 successfully.
exit