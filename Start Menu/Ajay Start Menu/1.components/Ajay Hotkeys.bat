@echo off
color 0a
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
del D:/Ajay_prefix/wget_files/Ajay_Hotkeys.7z >NUL 2>&1
echo *** deleted temp files ***
echo *** Script made by Ajay ***

:: Downloading Ajay_Hotkeys if it doesn't exist
echo *** Checking for Ajay_Hotkeys ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\Ajay_Hotkeys_v1.7z" (
    echo *** Downloading Ajay_Hotkeys...***
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Ajay_Hotkeys_v1.7z
    copy /y D:\Ajay_prefix\wget_files\temp\Ajay_Hotkeys_v1.7z D:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** Ajay_Hotkeys already exists ***
)

:: Extracting NSIS
color 1f
echo *** Extracting Ajay_Hotkeys ***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\Ajay_Hotkeys_v1.7z -oD:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo *** Extraction failed. Please check the file and try again ***
    pause
    exit /b
)

:: Launching the Installer
echo *** Opening Ajay_Hotkeys ***
Start "" D:\Ajay_prefix\wget_files\temp\Ajay_Hotkeys.exe

echo ************************************************
