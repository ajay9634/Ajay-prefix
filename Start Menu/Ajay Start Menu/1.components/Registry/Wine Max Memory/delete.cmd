@echo off
echo Removing Wine maximum memory cap (set to unlimited)...

reg delete "HKEY_CURRENT_USER\Software\Wine" /v "MaxMemory" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Wine" /v "MaxMemory" /f >nul 2>&1

timeout.exe /t 4 /nobreak >nul 2>&1
echo Wine maximum memory cap has been removed successfully (set to unlimited).
exit