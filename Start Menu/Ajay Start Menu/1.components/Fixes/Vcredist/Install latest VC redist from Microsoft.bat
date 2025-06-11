@echo off
color 84
title VC Redist Installer by Ajay
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
:: Set paths
set "temp_dir=%drive_letter%:\Ajay_prefix\wget_files\temp"
set "file_dir=%drive_letter%:\Ajay_prefix\wget_files\Files"

:: Cleanup old files
echo.
echo *** Deleting temp files... ***
rmdir /S /Q "%temp_dir%" >NUL 2>&1
mkdir "%temp_dir%" >NUL 2>&1
echo *** Deleted temp files ***
echo.
cls
:choice
echo Latest VC redist x86 and x64 Installation from Microsoft :
echo.
:: Ask user
echo 1. Download and install latest VC Redist files
echo 2. Install pre-downloaded VC Redist files
echo 3. Exit
echo.
set /p choice="Press number key [1-3]: "

if "%choice%"=="1" goto download_and_install
if "%choice%"=="2" goto install_local
if "%choice%"=="3" goto end
goto invalid

:download_and_install
del /F /Q /A "%file_dir%\vc_redist.x86.exe" >NUL 2>&1
del /F /Q /A "%file_dir%\vc_redist.x64.exe" >NUL 2>&1
color 0A
echo.
echo *** Downloading VC Redist x86 and x64 ***

:: URLs
set "x86url=https://aka.ms/vs/17/release/vc_redist.x86.exe"
set "x64url=https://aka.ms/vs/17/release/vc_redist.x64.exe"

:: Download
wget -q --show-progress -P "%temp_dir%" --progress=dot:mega %x86url%
wget -q --show-progress -P "%temp_dir%" --progress=dot:mega %x64url%

:: Copy to final location
copy /y "%temp_dir%\vc_redist.x86.exe" "%file_dir%\vc_redist.x86.exe" >NUL
copy /y "%temp_dir%\vc_redist.x64.exe" "%file_dir%\vc_redist.x64.exe" >NUL

goto install_local

:install_local
echo.
echo *** Installing VC Redist files ***

if not exist "%file_dir%\vc_redist.x86.exe" (
    echo [ERROR] vc_redist.x86.exe not found!
    goto choice
)

if not exist "%file_dir%\vc_redist.x64.exe" (
    echo [ERROR] vc_redist.x64.exe not found!
    goto choice
)

"%file_dir%\vc_redist.x86.exe" /repair /passive /norestart
timeout /t 2 /nobreak >NUL
"%file_dir%\vc_redist.x64.exe" /repair /passive /norestart

echo.
echo [SUCCESS] VC Redistributables installed.

goto end

:invalid
echo.
echo [ERROR] Invalid input. Please enter 1, 2, or 3.
goto choice

:end
timeout /t 3 /nobreak >NUL
exit