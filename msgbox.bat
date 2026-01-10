@echo off
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
    echo.
    echo [INFO] Looks like you're using an outdated version of the Ajay prefix.
    echo [INFO] Please download the latest version from Ajay's GitHub.
    echo [INFO] The latest version 10.19 was uploaded on 16 July 2025.
    echo msgbox "You're using an outdated version of the Ajay prefix. Please download and install the latest version from Ajay's GitHub." , vbInformation+vbSystemModal > "%tmp%\tmp.vbs"
    cscript //nologo "%tmp%\tmp.vbs"
    del "%tmp%\tmp.vbs"
    echo Removing Start Menu Files..
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu"
) else (
    echo [INFO] The latest version 10.19 was uploaded on 16 July 2025.
    echo [INFO] You're using outdated version of scripts updater . Please Install the latest version from Ajay's GitHub.
    echo Removing Start Menu Files..
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu"
    @echo off
setlocal EnableDelayedExpansion

echo Downloading Latest version of Ajay Prefix Pro...

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
    echo Skipping download...
    goto :run_installer
)

:: If we reach here → file doesn't exist → download + copy
echo Downloading installer...
wget -q -P "%TEMP_FOLDER%" "%DOWNLOAD_URL%" >nul 2>&1

if not exist "%TEMP_FILE%" (
    echo.
    echo ERROR: Download failed! 
    echo Check your internet or the download link.
    pause
    exit /b 1
)

:: Create target folder if it doesn't exist
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%" >nul 2>&1

echo Copying installer to target...
copy /y "%TEMP_FILE%" "%TARGET_DIR%\" >nul 2>&1

if not exist "%TARGET_FILE%" (
    echo ERROR: Copy failed!
    pause
    exit /b 1
)

:run_installer
echo.
echo Starting installer...
start "" "%TARGET_FILE%"

echo.
echo Done!
timeout /t 3 >nul
exit /b 0
)

