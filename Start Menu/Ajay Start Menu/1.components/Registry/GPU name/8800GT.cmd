@echo off
echo Updating the registry with VideoPciDeviceID setting and removing VideoPciVendorID...
reg add "HKCU\Software\Wine\Direct3D" /v VideoPciDeviceID /t REG_DWORD /d 401 /f >nul 2>&1
reg delete "HKCU\Software\Wine\Direct3D" /v VideoPciVendorID /f >nul 2>&1
timeout.exe 6 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v VideoPciDeviceID /t REG_DWORD /d 401 /f >nul 2>&1

reg delete "HKCU\Software\Wine\Direct3D" /v VideoPciVendorID /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo Registry update completed.
exit /b