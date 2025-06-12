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
echo 1. Download and uninstall latest VC Redist files (first step - if you already installed latest vc redist 2022)
echo.
echo 2. Install vc redist 2015-2019 (main step)
echo.
echo 3. Exit
echo.
set /p choice="Press number key [1-3]: "

if "%choice%"=="1" goto download_and_install
if "%choice%"=="2" goto install
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

goto Uninstall_local

:Uninstall_local
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

"%file_dir%\vc_redist.x86.exe" /install /q /norestart
timeout /t 2 /nobreak >NUL
"%file_dir%\vc_redist.x64.exe" /install /q /norestart
timeout /t 5 /nobreak >NUL
"%file_dir%\vc_redist.x86.exe" /uninstall /q /norestart
timeout /t 2 /nobreak >NUL
"%file_dir%\vc_redist.x64.exe" /uninstall /q /norestart
echo.
echo Latest VC Redistributables Uninstalled.

:install 
echo installing vc 2015-2019
color 0A
echo.
echo *** Downloading vc_redist_2015-2019 ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\vc_redist_2019.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/vc_redist_2019.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\vc_redist_2019.7z %drive_letter%:\Ajay_prefix\wget_files\Files\vc_redist_2019.7z /E /H /C /I
) ELSE (
    ECHO vc_redist_2015-2019 already exists.
)


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\vc_redist_2019.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

echo *** install vcredist_2015-2019 manually , make sure you are using official or winlator ajay to prevent errors otherwise uninstall another version of vc redist manually ***
Start /wait %drive_letter%:\Ajay_prefix\wget_files\temp\vc_redist_2019.x86.exe /repair /norestart
Start /wait %drive_letter%:\Ajay_prefix\wget_files\temp\vc_redist_2019.x64.exe /repair /norestart

echo ************************************************

goto end

:invalid
echo.
echo [ERROR] Invalid input. Please enter 1, 2, or 3.
goto choice

:end
timeout /t 3 /nobreak >NUL
exit
