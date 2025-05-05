@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
echo Now delete or install downloaded mono manually
start "" "C:\windows\7zFM.exe" "%drive_letter%:\ajay_prefix\wget_files\mono\"
