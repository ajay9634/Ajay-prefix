@echo off
echo *** opening dosbox-staging ***
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
cd /d "%drive_letter%:\Ajay_prefix\wget_files\my_apps\dosbox-staging-windows-x64-0.83.0-alpha-abd34"
Start dosbox-staging.bat
echo ************************************************
timeout.exe /t 3 >nul
