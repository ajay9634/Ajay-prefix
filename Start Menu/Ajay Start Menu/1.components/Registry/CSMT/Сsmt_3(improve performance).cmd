@echo off
echo Updating the registry with csmt setting...
reg add "HKCU\Software\Wine\Direct3D" /v csmt /t REG_DWORD /d 3 /f >nul 2>&1
timeout.exe 10 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v csmt /t REG_DWORD /d 3 /f >nul 2>&1
echo Registry update completed.
exit /b
