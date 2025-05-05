@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
echo Exporting all applied env variables info to drive %drive_letter% as txt ...
set /p fname=Type name : 
set outfile=%drive_letter%:\%fname% environment variables.txt
echo Saving environment variables to %outfile%...
set > "%outfile%"
echo Done!
pause
