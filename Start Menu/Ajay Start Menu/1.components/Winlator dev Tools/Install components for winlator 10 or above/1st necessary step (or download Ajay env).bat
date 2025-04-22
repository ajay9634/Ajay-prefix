@echo off
color 1F
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
cls
echo "Hello! This is a necessary step before downloading Winlator stuff for winlator 10 or above. You have two options to proceed -"
echo.
echo 1 - Rename the drive E path manually and remove 'storage' from the end. (exit)
echo 2 - Download and Replace the .container file with Ajay env ! (continue this script)
echo.
set /p choice="Press 2 to continue or 1 to exit: "

if /i "%choice%"=="1" (
    echo Operation canceled.
    exit /b
)

if /i not "%choice%"=="2" (
    echo Invalid choice. Exiting...
    exit /b
)
title 1st Step
cls
echo ----------------------------------------------------------------------------

echo 1st Step before installing winlator stuff

echo ----------------------------------------------------------------------------
echo Are you sure you want to copy and replace ".container" to "Z:\home\xuser\"?  
echo This may corrupt container settings in Winlator 10 official or above !
echo You need to modify container settings after exiting this container. 
echo New updated container will be named as "Container-Ajay" then rename it as you like !
echo You can install different box64, Turnip, dxvk and other additional stuff after installing this.
echo.
echo Still want to continue? (Y/N)
echo.
set /p choice="Press Y to continue or N to exit: "

if /i "%choice%"=="N" (
    echo Operation canceled.
    exit /b
)

if /i not "%choice%"=="Y" (
    echo Invalid choice. Exiting...
    exit /b
)

if not exist "C:\windows\temp" mkdir "C:\windows\temp"

@echo off
echo Downloading .container file (Don't disconnect internet)...

:: Corrected GitHub Raw URL
wget -q --show-progress -P C:/windows/temp/ "https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Winlator-10-stuff/installable_components/.container"

:: Check if download was successful
if not exist "C:\windows\temp\.container" (
    echo Error: File not found. Download may have failed.
    pause
)

timeout.exe 5 /nobreak
echo Copying file...
copy /Y "C:\windows\temp\.container" "Z:\home\xuser\"
echo File copied successfully.

echo Exiting Current Container...
timeout.exe 5 /nobreak
taskkill /F /IM Start.exe
exit /b
