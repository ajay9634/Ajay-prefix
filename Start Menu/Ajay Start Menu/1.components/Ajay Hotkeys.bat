@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** deleting temp files...***
taskkill /f /t /im Ajay_Hotkeys.exe >NUL 2>&1
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
del %drive_letter%:/Ajay_prefix/wget_files/Files/Ajay_Hotkeys.7z >NUL 2>&1
del C:/windows/Ajay_Hotkeys.exe >NUL 2>&1
echo *** deleted temp files ***
echo *** Script made by Ajay ***

:: Downloading Ajay_Hotkeys if it doesn't exist
echo *** Checking for Ajay_Hotkeys ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Ajay_Hotkeys_v1.7z" (
    echo *** Downloading Ajay_Hotkeys...***
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Ajay_Hotkeys_v1.7z
    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\Ajay_Hotkeys_v1.7z %drive_letter%:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** Ajay_Hotkeys already exists ***
)

:: Extracting NSIS
color 1f
echo *** Extracting Ajay_Hotkeys ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\Ajay_Hotkeys_v1.7z -oC:\windows\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo *** Extraction failed. Please check the file and try again ***
    pause
    exit /b
)

:: Launching the Installer
timeout.exe /t 1 >nul
echo *** Opening Ajay_Hotkeys ***
Start "" C:\windows\Ajay_Hotkeys.exe
timeout.exe /t 3 >nul
echo ************************************************
