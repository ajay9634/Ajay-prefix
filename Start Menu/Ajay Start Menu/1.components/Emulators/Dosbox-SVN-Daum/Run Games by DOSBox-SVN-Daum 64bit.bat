@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
Start %drive_letter%:\Ajay_prefix\wget_files\my_apps\DOSBox-SVN-Daum\dosbox_x64.bat
echo ************************************************
timeout.exe /t 3 >nul
