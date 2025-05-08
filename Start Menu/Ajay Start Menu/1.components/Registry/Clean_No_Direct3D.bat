@echo off
color 84
echo Cleaning...
reg delete "HKEY_CURRENT_USER\Software\Wine\Direct3D" /va /f >NUL 2>&1
timeout.exe /t 6 /nobreak >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Wine\Direct3D" /va /f >NUL 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
