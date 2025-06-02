@echo off
echo *** opening scummvm ***
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
echo msgbox "Hello! Copy scummvm supported games in %drive_letter%:\Ajay_prefix\wget_files\my_apps\scummvm , Then type game ID or game folder name. " , vbinformation+vbSystemModal > %tmp%\tmp.vbs
start /b cscript //nologo %tmp%\tmp.vbs
timeout /t 2 >nul
del %tmp%\tmp.vbs
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
cd /d "%drive_letter%:\Ajay_prefix\wget_files\my_apps\scummvm"
Start Run_game.bat
echo ************************************************
timeout.exe /t 3 >nul
