@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
if exist "%drive_letter%:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XInput\Bin\x86\RumbleController.exe" goto Run

echo *** deleting temp2 files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp2" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp2" >NUL 2>&1
echo *** Script made by Ajay ***

:: Downloading Microsoft Samples if it doesn't exist
echo *** Checking for Microsoft Samples ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Microsoft_Samples.7z" (
    echo *** Downloading Microsoft Samples...***
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp2/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Microsoft_Samples.7z
    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp2\Microsoft_Samples.7z %drive_letter%:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** File already exists.***
)

:: Extracting Microsoft Samples
color 1f
echo *** Extracting Microsoft Samples ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\Microsoft_Samples.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp2\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo *** Extraction failed. Please check the file and try again.***
    pause
    exit /b
)

:: Launching the Installer
:Run
echo *** Opening Microsoft Samples ***
Start /wait "" %drive_letter%:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XInput\Bin\x86\RumbleController.exe

echo ************************************************
timeout.exe /t 3 >nul
