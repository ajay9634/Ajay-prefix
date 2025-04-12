@echo off
color 0a
if exist "D:\Ajay_prefix\wget_files\temp\Microsoft_Samples\C++\XInput\Bin\x86\AudioController.exe" goto Run

echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** Script made by Ajay ***

:: Downloading Microsoft Samples if it doesn't exist
echo *** Checking for Microsoft Samples ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\Microsoft_Samples.7z" (
    echo *** Downloading Microsoft Samples...***
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Microsoft_Samples.7z
    copy /y D:\Ajay_prefix\wget_files\temp\Microsoft_Samples.7z D:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** File already exists.***
)

:: Extracting Microsoft Samples
color 1f
echo *** Extracting Microsoft Samples ***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\Microsoft_Samples.7z -oD:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo *** Extraction failed. Please check the file and try again.***
    pause
    exit /b
)

:: Launching the Installer
:Run
echo *** Opening Microsoft Samples ***
Start /wait "" D:\Ajay_prefix\wget_files\temp\Microsoft_Samples\C++\XInput\Bin\x86\AudioController.exe

echo ************************************************
timeout.exe /t 3 >nul
