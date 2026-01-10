@echo off
setlocal EnableDelayedExpansion
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1E

:: checking Ajay prefix offline files update status
set "toolpath=%drive_letter%:\Ajay_prefix\.Resources\7z.exe"
set "archive=%drive_letter%:\Ajay_prefix\.Resources\Start_Menu.7z"
set "password=-p-q"
set "expected_file=10.19.txt"

REM Check if expected file is inside the archive (quietly)
"%toolpath%" l "%archive%" %password% 2>nul | findstr /I /C:"%expected_file%" >nul 2>&1
if errorlevel 1 (
    goto Installation  
) else (
    goto Installation
)

:Installation
echo [INFO] You're using outdated version of Ajay Prefix.

set "TARGET_DIR=Z:\home\.Ajay.Prefix.Pro.v1.3"
set "EXE_NAME=Ajay.Prefix.Pro.v1.3.Installer.exe"
set "TARGET_FILE=%TARGET_DIR%\%EXE_NAME%"
set "TEMP_FOLDER=C:\Temp"
set "TEMP_FILE=%TEMP_FOLDER%\%EXE_NAME%"
set "DOWNLOAD_URL=https://github.com/ajay9634/Ajay-prefix/releases/download/Ajay_Prefix_Pro_1.3/Ajay.Prefix.Pro.v1.3.Installer.exe"

:: Create temp folder if needed
if not exist "%TEMP_FOLDER%" mkdir "%TEMP_FOLDER%" >nul 2>&1

:: ── Main logic: check if the .exe already exists in target ──
if exist "%TARGET_FILE%" (
    echo.
    echo Installer already exists in target location:
    echo %TARGET_FILE%
    echo.
    echo Skipping download...
    goto :run_installer
)

:: If we reach here → file doesn't exist → download + copy
echo.
echo Downloading Ajay Prefix Pro...
wget -q -P "%TEMP_FOLDER%" "%DOWNLOAD_URL%" >nul 2>&1

if not exist "%TEMP_FILE%" (
    echo.
    echo ERROR: Download failed! 
    echo.
    echo Check your internet or the download link.
    echo.
    pause
    exit /b 1
)

:: Create target folder if it doesn't exist
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%" >nul 2>&1

echo.
echo Copying installer to Drive Z...
copy /y "%TEMP_FILE%" "%TARGET_DIR%\" >nul 2>&1

if not exist "%TARGET_FILE%" (
    echo.
    echo ERROR: Copy failed!
    pause
    exit /b 1
)

:run_installer
echo.
echo Starting installer...
start "" "%TARGET_FILE%"

echo.
echo Removing Old Start Menu Files ..
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu"
echo.
echo Done!
timeout /t 3 >nul
exit /b 0
)

