@echo off
echo Removing the VideoMemorySize setting in Wine's Direct3D...
reg delete "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VideoMemorySize" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg delete "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VideoMemorySize" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo VideoMemorySize setting has been removed successfully.
exit