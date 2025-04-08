@echo off
setlocal enabledelayedexpansion
color 1E
title Ajay Start Menu installation
echo Don't close this window!

:: Kill archive tools if running
taskkill /F /IM 7z.exe /T >NUL 2>&1
taskkill /F /IM winrar.exe /T >NUL 2>&1

echo Checking ".Resources" files ...

:: Check if offline resource exists
if not exist "D:\Ajay_prefix\.Resources\Resources.7z" (
    echo msgbox "Hello! Looks like Ajay prefix offline files are missing from D drive. Expect limited Start Menu functionality!" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
    cscript //nologo %tmp%\tmp.vbs
    del %tmp%\tmp.vbs
    goto delete_offline_scripts
) else (
    echo Resources.7z found.
)

:: File date check
set "expected_date=03/29/2025"
set "file=D:\Ajay_prefix\.Resources\Start_Menu.7z"

for /f "tokens=1-3*" %%a in ('dir "%file%" ^| findstr /i "Start_Menu.7z"') do (
    set "date=%%a"
)

if not "!date!"=="%expected_date%" (
    echo.
    echo Looks like you're using an old version of the Ajay prefix.
    echo Please download the latest version from Ajay's GitHub.
    echo msgbox "You're using an old version of the Ajay prefix. Please download the latest version from Ajay's GitHub." , vbinformation+vbSystemModal > %tmp%\tmp.vbs
    cscript //nologo %tmp%\tmp.vbs
    del %tmp%\tmp.vbs
) else (
    echo Ajay prefix offline files are up to date.
    goto necessary_files
)

:necessary_files
echo Updating some offline scripts and necessary files...

:: Clean up old components
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\2.offline components" >NUL 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\3.GPU Test" >NUL 2>&1
del /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\install necessary files.bat" >NUL 2>&1
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*Backup and Restore*" >nul 2>&1
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*export and import*" >nul 2>&1

:: Download and extract updates
wget -q -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/offline_scripts_update.7z
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\temp\offline_scripts_update.7z -oC:\ -r -y >NUL 2>&1

:checked
if not exist "C:\windows\curl.exe" (
    echo Curl not found. Downloading update...
    wget -q -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/update.7z
    xcopy /s /y D:\Ajay_prefix\wget_files\temp\update.7z D:\Ajay_prefix\.Resources\ /E /H /C /I >NUL 2>&1
    rmdir /S /Q "C:/windows/temp" >NUL 2>&1
    mkdir "C:/windows/temp"
    D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\.Resources\update.7z -oC:\windows\temp\ -r -y >NUL 2>&1
    echo *** Installing... ***
    xcopy /s /y C:\windows\temp\ C:\ /E /H /C /I >NUL 2>&1
)

title Ajay Start Menu installation

if not exist "C:\windows\curl.exe" (
    echo msgbox "Hello! Some fixes failed to install. Check your internet connection!" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
    cscript //nologo %tmp%\tmp.vbs
    del %tmp%\tmp.vbs
)

:: Steam detection warning
if exist "C:\Program Files (x86)\Steam" (
    echo msgbox "Hello! Steam detected. Please back up save files manually!" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
    cscript //nologo %tmp%\tmp.vbs
    del %tmp%\tmp.vbs
)

:: Create required directories
mkdir D:\Ajay_prefix\wget_files\d3d 2>nul
mkdir D:\Ajay_prefix\wget_files\dsound 2>nul
mkdir D:\Ajay_prefix\wget_files\Files 2>nul
mkdir D:\Ajay_prefix\wget_files\Fixes 2>nul
mkdir D:\Ajay_prefix\wget_files\Game-fixes 2>nul
mkdir D:\Ajay_prefix\wget_files\NET 2>nul
mkdir D:\Ajay_prefix\wget_files\physx 2>nul
mkdir D:\Ajay_prefix\wget_files\temp 2>nul
mkdir D:\Ajay_prefix\wget_files\my_apps 2>nul
mkdir D:\Ajay_prefix\save_data\users\Registry_backup 2>nul
mkdir D:\Ajay_prefix\save_data\users\xuser\AppData\Local 2>nul
mkdir D:\Ajay_prefix\save_data\users\xuser\AppData\Roaming 2>nul
mkdir D:\Ajay_prefix\save_data\users\xuser\Documents 2>nul
mkdir "D:\Ajay_prefix\save_data\users\xuser\Documents\My Games" 2>nul
mkdir "D:\Ajay_prefix\save_data\users\xuser\Saved Games" 2>nul

if exist "C:\windows\timeout.exe" (
    copy /Y "C:\windows\timeout.exe" "C:\windows\system32\timeout.exe" >nul 2>&1
)

cls
echo Please wait...

rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1

echo msgbox "Hello! Ajay Prefix components are updated successfully. Changelog and files saved to D:/Ajay_prefix/wget_files/!" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript //nologo %tmp%\tmp.vbs
timeout /t 2 >nul
del %tmp%\tmp.vbs
timeout /t 2 >nul
exit

:delete_offline_scripts
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\2.offline components" >nul 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\3.GPU Test" >nul 2>&1
del /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\install necessary files.bat" >nul 2>&1
goto checked

exit /b
