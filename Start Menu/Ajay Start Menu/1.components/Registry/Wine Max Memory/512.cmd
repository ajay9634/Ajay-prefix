@echo off
echo Setting Wine maximum memory to 512 MB...

reg add "HKEY_CURRENT_USER\Software\Wine" /v "MaxMemory" /t REG_SZ /d "512" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Wine" /v "MaxMemory" /t REG_SZ /d "512" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo Wine maximum memory has been set to 512 MB successfully.
exit