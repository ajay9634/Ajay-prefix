@echo off
echo Updating the registry to remove CheckFloatConstants...
reg delete "HKCU\Software\Wine\Direct3D" /v CheckFloatConstants /f >nul 2>&1
timeout.exe 10 /nobreak >nul 2>&1
reg delete "HKCU\Software\Wine\Direct3D" /v CheckFloatConstants /f >nul 2>&1
echo Registry update completed.
exit /b