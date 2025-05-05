@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
if exist "%drive_letter%:\Ajay_prefix\wget_files\temp\GPUInfo.exe" goto Run

mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** Script made by Ajay ***

:: Downloading Microsoft Samples if it doesn't exist
echo *** Checking for GPUInfo by BrunoSX ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\GPUInfo.7z" (
    echo *** Downloading GPUInfo by BrunoSX ***
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/GPUInfo.7z
    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\GPUInfo.7z %drive_letter%:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** File already exists.***
)

:: Extracting Microsoft Samples
color 1f
echo *** Extracting GPUInfo ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\GPUInfo.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo *** Extraction failed. Please check the file and try again.***
    pause
    exit /b
)

:: Launching the Installer
:Run
echo *** Opening GPUInfo ***
Start /wait "" %drive_letter%:\Ajay_prefix\wget_files\temp\GPUInfo.exe

echo ************************************************
timeout.exe /t 2 >nul
