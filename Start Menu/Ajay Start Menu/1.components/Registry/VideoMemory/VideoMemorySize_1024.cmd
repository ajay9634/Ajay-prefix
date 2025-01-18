@echo off
echo Setting VideoMemorySize to 1024 in Wine's Direct3D...
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VideoMemorySize" /t REG_SZ /d "1024" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VideoMemorySize" /t REG_SZ /d "1024" /f >nul 2>&1
echo VideoMemorySize setting has been set to 1024 successfully.
exit