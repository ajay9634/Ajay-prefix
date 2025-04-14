@echo off
setlocal enabledelayedexpansion
color 0A
echo *** Checking Available Wine Mono Versions ***

:: Create necessary folders
mkdir "D:\Ajay_prefix\wget_files\temp" >nul 2>&1

:: Delete existing JSON file
del "D:\Ajay_prefix\wget_files\temp\releases.json" >nul 2>&1

:: Fetch JSON using curl (without progress shown)
curl -s -L "https://api.github.com/repos/wine-mono/wine-mono/releases" -o "D:\Ajay_prefix\wget_files\temp\releases.json"

:: Check if JSON file exists
if not exist "D:\Ajay_prefix\wget_files\temp\releases.json" (
    echo Failed to fetch release list.
    goto version_input
)

:: Display available versions
echo.
echo *** Available Wine Mono Versions ***
echo -------------------------------------
for /f "tokens=2 delims=:" %%A in ('findstr /C:"tag_name" "D:\Ajay_prefix\wget_files\temp\releases.json"') do (
    set "line=%%A"
    set "line=!line:,=!"
    set "line=!line:"=!"
    set "line=!line:~11!"
    echo     !line!
)
echo -------------------------------------
echo.

:version_input
:: Prompt for user input
set /p "typed_version=Type the version [e.g. 10.0.0]: "
if not defined typed_version (
    set "typed_version=%version%"
)
echo You entered version: %typed_version%
echo.

:: Deleting temporary files
echo *** Deleting temporary files... ***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >nul 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >nul 2>&1
mkdir "D:/Ajay_prefix/wget_files/mono" >nul 2>&1
echo *** Deleted temporary files ***
echo.
echo *** Script made by Ajay ***

:: Download installer if it doesn't exist (show progress only during curl)
IF NOT EXIST "D:/Ajay_prefix/wget_files/mono/wine-mono-%typed_version%-x86.msi" (
    echo.
    echo *** Downloading mono %typed_version% ***
    curl -L --progress-bar -o "D:/Ajay_prefix/wget_files/temp/wine-mono-%typed_version%-x86.msi" "https://dl.winehq.org/wine/wine-mono/%typed_version%/wine-mono-%typed_version%-x86.msi"
) ELSE (
    echo File already exists.
    goto exist
)

:: Check if download was successful
IF EXIST "D:/Ajay_prefix/wget_files/temp/wine-mono-%typed_version%-x86.msi" (
    echo *** Download successful! ***
    copy /y "D:/Ajay_prefix/wget_files/temp/wine-mono-%typed_version%-x86.msi" "D:/Ajay_prefix/wget_files/mono/wine-mono-%typed_version%-x86.msi" >nul 2>&1
) ELSE (
    echo Error: Version %typed_version% not found or download failed.
    echo Please check the version and internet connection then try again.
    goto version_input
)

:: Install
:exist
color 1f
IF EXIST "D:/Ajay_prefix/wget_files/mono/wine-mono-%typed_version%-x86.msi" (
    echo *** Installing wine mono %typed_version% ... ***
    start /wait msiexec /i "D:/Ajay_prefix/wget_files/mono/wine-mono-%typed_version%-x86.msi" /quiet
    cls
    echo Installation completed successfully.
) ELSE (
    cls
    echo Installation failed: MSI file not found!
    pause
    exit /b
)

echo ***********************************************
pause
