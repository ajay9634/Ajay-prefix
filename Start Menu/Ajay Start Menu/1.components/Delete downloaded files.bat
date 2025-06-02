@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
echo deleting temp files
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" > NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\1.components" > NUL 2>&1
echo Now delete downloaded files manually
start "" "C:\windows\7zFM.exe" "%drive_letter%:\ajay_prefix\wget_files\"

