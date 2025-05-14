@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** You can check exe info in details  ***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo *** Script made by Ajay ***

:: Downloading file if it doesn't exist
echo *** Checking for opengl_demos ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\opengl_demos.7z" (
    echo *** Downloading opengl_demos... ***
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/opengl_demos.7z
    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\opengl_demos.7z %drive_letter%:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** opengl_demos already exists. ***
)

color 1f
echo *** Extracting opengl_demos ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\opengl_demos.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo *** Extraction failed. Please check the file and try again. ***
    pause
    exit /b
)

call "C:\Windows\Ajay_drive.bat" >nul 2>&1
cd /d %drive_letter%:\Ajay_prefix\wget_files\temp\opengl_demos
Start wave.exe
echo ************************************************
timeout.exe /t 3 >nul
