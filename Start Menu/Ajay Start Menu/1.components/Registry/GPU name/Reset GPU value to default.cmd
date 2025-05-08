@echo off
echo Removing VideoPciDeviceID and VideoPciVendorID registry entries...
reg delete "HKCU\Software\Wine\Direct3D" /v VideoPciDeviceID /f >nul 2>&1
reg delete "HKCU\Software\Wine\Direct3D" /v VideoPciVendorID /f >nul 2>&1
timeout.exe 6 /nobreak >nul 2>&1
reg delete "HKCU\Software\Wine\Direct3D" /v VideoPciDeviceID /f >nul 2>&1
reg delete "HKCU\Software\Wine\Direct3D" /v VideoPciVendorID /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo done
exit /b
