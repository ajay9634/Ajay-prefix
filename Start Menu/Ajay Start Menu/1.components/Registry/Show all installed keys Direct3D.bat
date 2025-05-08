@echo off
color 0b
echo Open...
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Wine\Direct3D" /f >NUL 2>&1
start C:\windows\regedit.exe
timeout.exe /t 3 /nobreak >nul 2>&1

