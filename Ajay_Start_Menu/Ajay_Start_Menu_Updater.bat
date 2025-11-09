@echo off

:: Setup drive
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

if exist "%StartMenu%" (
echo.
echo [ OK ] Downloaded successfully

echo [STEP] Removing old Start Menu
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\1. Components" >nul 2>&1

rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\2. Offline Components" >nul 2>&1

rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\7. Export and Import Registry" >nul 2>&1

) else (
cls
echo.
color 0C
echo [ERROR] Ajay Start Menu package not found.
echo.
echo [INFO ] Download may have failed. Check internet and retry.
goto end
)

del /f /q "%drive_letter%:\Ajay_prefix\wget_files\%StartMenu%" >nul 2>&1

xcopy /s /y "%StartMenu%" "%drive_letter%:\Ajay_prefix\wget_files" >nul 2>&1

echo.
echo [STEP] Installing Ajay Start Menu package ...
"C:\windows\7z.exe" x "%drive_letter%:\Ajay_prefix\wget_files\Start_Menu.7z" -p-q -o"C:\windows\temp" -y >nul 2>&1

xcopy /s /y "C:\Windows\Temp\ProgramData" "C:\ProgramData" /E /H /C /I >nul 2>&1

echo.
echo [STEP] Saving changelog...

del /f /q "%drive_letter%:\Ajay_prefix\wget_files\Changelog.txt" >nul 2>&1

xcopy /s /y "C:\Windows\Temp\Changelog.txt" "%drive_letter%:\Ajay_prefix\wget_files" >nul 2>&1

wget -q -P "C:\Windows\Temp" "https://github.com/ajay9634/Ajay-prefix/releases/download/Ajay_prefix/README.txt"

timeout /t 2 >NUL 2>&1
if not exist "Z:\home\xuser" (
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\1. Components\Winlator dev Tools"
    taskkill /F /IM wfm2.exe >nul 2>&1
    start "" "C:\Windows\wfm2.exe"
)

mkdir %drive_letter%:\Ajay_prefix\wget_files\d3d 2>nul
mkdir %drive_letter%:\Ajay_prefix\wget_files\dsound 2>nul
mkdir %drive_letter%:\Ajay_prefix\wget_files\Files 2>nul
mkdir %drive_letter%:\Ajay_prefix\wget_files\Fixes 2>nul
mkdir %drive_letter%:\Ajay_prefix\wget_files\Game-fixes 2>nul
mkdir %drive_letter%:\Ajay_prefix\wget_files\NET 2>nul
mkdir %drive_letter%:\Ajay_prefix\wget_files\physx 2>nul
mkdir %drive_letter%:\Ajay_prefix\wget_files\temp 2>nul
mkdir %drive_letter%:\Ajay_prefix\wget_files\my_apps 2>nul
mkdir %drive_letter%:\Ajay_prefix\save_data\users\Registry_backup 2>nul
mkdir %drive_letter%:\Ajay_prefix\save_data\users\xuser\AppData\Local 2>nul
mkdir %drive_letter%:\Ajay_prefix\save_data\users\xuser\AppData\Local\Temp 2>nul
mkdir %drive_letter%:\Ajay_prefix\save_data\users\xuser\AppData\Roaming 2>nul
mkdir %drive_letter%:\Ajay_prefix\save_data\users\xuser\Documents 2>nul
mkdir "%drive_letter%:\Ajay_prefix\save_data\users\xuser\Documents\My Games" 2>nul
mkdir "%drive_letter%:\Ajay_prefix\save_data\users\xuser\Saved Games" 2>nul

rmdir /S /Q "C:\windows\temp\ProgramData" 2>nul
"C:\windows\7z.exe" x "C:\Program Files (x86)\AutoIt3\AutoIt3_exe_backup.7z" -o"C:\Program Files (x86)\AutoIt3" -y >nul 2>&1 ==========================================================
echo [ OK ] Ajay Start Menu scripts updated successfully !
echo.
echo

echo [UPDATE INFO] Install Ajay Prefix Pro from official GitHub !
    echo msgbox "[UPDATE INFO] Install Ajay Prefix Pro from official GitHub !", 64+4096, "Status" > "%tmp%\tmp.vbs"

start /b wscript //nologo "%tmp%\tmp.vbs" ----------------------------------------------------------
echo [INFO] Check the Start Menu for changes.
Start C:\ProgramData\Temp\Temp_Cleaner.ajau3

echo ==========================================================

:end
echo.
