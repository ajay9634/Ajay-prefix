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
    pause
)

