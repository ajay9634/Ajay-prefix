@echo off
echo Setting VideoPciDeviceID and VideoPciVendorID in Wine...

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VideoPciDeviceID" /t REG_DWORD /d 00000405 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VideoPciVendorID" /t REG_DWORD /d 000015ad /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

echo VideoPciDeviceID and VideoPciVendorID have been set successfully in Wine.
exit