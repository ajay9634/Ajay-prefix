@echo off
color 0a
echo *** You can convert zip to exe or you can compile NSIS scripts ***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** Script made by Ajay ***

:: Downloading NSIS-3.11 if it doesn't exist
echo *** Checking for NSIS-3.11 Setup ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\nsis-3.11-setup.7z" (
    echo *** Downloading NSIS-3.11...***
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/nsis-3.11-setup.7z
    copy /y D:\Ajay_prefix\wget_files\temp\nsis-3.11-setup.7z D:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** NSIS-3.11 setup already exists.***
)

:: Extracting NSIS
color 1f
echo *** Extracting NSIS-3.11 ***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\nsis-3.11-setup.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo *** Extraction failed. Please check the file and try again.***
    pause
    exit /b
)

:: Launching the Installer
echo *** Opening NSIS-3.11 Setup ***
Start "" D:\Ajay_prefix\wget_files\temp\nsis-3.11-setup.exe

echo ************************************************
timeout.exe /t 3 >nul
