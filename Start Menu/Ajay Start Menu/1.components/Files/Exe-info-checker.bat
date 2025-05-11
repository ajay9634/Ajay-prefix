@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** You can check exe info in details  ***
echo *** Script made by Ajay ***

:: Downloading file if it doesn't exist
echo *** Checking for Exe-info-checker ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Exe-info-checker.7z" (
    echo *** Downloading Exe-info-checker... ***
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Exe-info-checker.7z
    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\Exe-info-checker.7z %drive_letter%:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** Exe-info-checker already exists. ***
)

:: Extracting NSIS
color 1f
echo *** Extracting Exe-info-checker ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\Exe-info-checker.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo *** Extraction failed. Please check the file and try again. ***
    pause
    exit /b
)

:: Launching the Installer
echo *** Opening Exe-info-checker  ***
echo msgbox "Hello! Extract it in game exe or app exe folder !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
start /b cscript //nologo %tmp%\tmp.vbs
timeout.exe /t 1 >nul
del %tmp%\tmp.vbs
Start /wait "" "%drive_letter%:\Ajay_prefix\wget_files\temp\Exe-info-checker.exe"

echo ************************************************
timeout.exe /t 3 >nul
