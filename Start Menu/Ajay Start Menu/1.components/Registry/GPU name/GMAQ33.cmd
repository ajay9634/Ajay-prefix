@echo off
echo Updating the registry with VideoPciDeviceID and VideoPciVendorID settings...
reg add "HKCU\Software\Wine\Direct3D" /v VideoPciDeviceID /t REG_DWORD /d 10530 /f >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v VideoPciVendorID /t REG_DWORD /d 32902 /f >nul 2>&1
timeout.exe 6 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v VideoPciDeviceID /t REG_DWORD /d 10530 /f >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v VideoPciVendorID /t REG_DWORD /d 32902 /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo Registry update completed.
exit /b
