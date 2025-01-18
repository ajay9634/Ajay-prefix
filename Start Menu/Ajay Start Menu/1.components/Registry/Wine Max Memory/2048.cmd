@echo off
echo Setting Wine maximum memory to 2048 MB...

reg add "HKEY_CURRENT_USER\Software\Wine" /v "MaxMemory" /t REG_SZ /d "2048" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

echo Wine maximum memory has been set to 2048 MB successfully.
exit