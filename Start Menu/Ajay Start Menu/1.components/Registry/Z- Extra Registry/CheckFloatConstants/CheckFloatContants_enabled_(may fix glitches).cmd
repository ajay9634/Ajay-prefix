@echo off
echo Updating the registry with Wine Direct3D settings...
reg add "HKCU\Software\Wine\Direct3D" /v CheckFloatConstants /t REG_SZ /d enabled /f >nul 2>&1
timeout.exe 6 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v CheckFloatConstants /t REG_SZ /d enabled /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo Registry update completed.
exit /b