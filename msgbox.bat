@echo off
setlocal enabledelayedexpansion
color 1E
mkdir "%LOCALAPPDATA%\Temp" >NUL 2>&1
set "tempPath="%Temp%"
if not exist "%Temp%" (
    mkdir "%Temp%"
    echo Folder created at: "%Temp%"
) else (
    echo Folder already exists at: "%Temp%"
)

title Ajay Start Menu installation
echo Don't close this window!

:: Kill archive tools if running
taskkill /F /IM 7z.exe /T >NUL 2>&1
taskkill /F /IM winrar.exe /T >NUL 2>&1

echo Checking ".Resources" files ...

:: Check if offline resource exists
if not exist "D:\Ajay_prefix\.Resources\Resources.7z" (
echo msgbox " Looks like Ajay prefix offline files are missing from D drive." , vbinformation+vbSystemModal > %tmp%\tmp.vbs
    cscript //nologo %tmp%\tmp.vbs
    del %tmp%\tmp.vbs
    goto delete_offline_scripts
) else (
    echo Resources.7z found.
)

set "toolpath=D:\Ajay_prefix\.Resources\7z.exe"
set "archive=D:\Ajay_prefix\.Resources\Start_Menu.7z"
set "password=-p-q"
set "expected_folder=8.Backup and Restore drive C users and ProgramData"

REM Check if expected folder is anywhere in the archive (quietly)
"%toolpath%" l "%archive%" %password% 2>nul | findstr /I /C:"%expected_folder%" >nul 2>&1
if errorlevel 1 (
    echo.
    echo Looks like you're using an outdated version of the Ajay prefix.
    echo Please download the latest version from Ajay's GitHub.
    echo The latest version 10.16 fix was uploaded on 29 March 2025.
    echo msgbox "You're using an outdated version of the Ajay prefix. Please download the latest version from Ajay's GitHub." , vbInformation+vbSystemModal > %tmp%\tmp.vbs
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
del /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\Check_Ajay_prefix_status.bat" >NUL 2>&1
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
mkdir D:\Ajay_prefix\save_data\users\xuser\AppData\Local\Temp 2>nul
mkdir D:\Ajay_prefix\save_data\users\xuser\AppData\Roaming 2>nul
mkdir D:\Ajay_prefix\save_data\users\xuser\Documents 2>nul
mkdir "D:\Ajay_prefix\save_data\users\xuser\Documents\My Games" 2>nul
mkdir "D:\Ajay_prefix\save_data\users\xuser\Saved Games" 2>nul

if exist "C:\windows\timeout.exe" (
    copy /Y "C:\windows\timeout.exe" "C:\windows\system32\timeout.exe" >nul 2>&1
)

cls
echo Please wait...

reg add "HKCU\Software\7-Zip\FM" /v ShowRealFileIcons /t REG_DWORD /d 1 /f >nul 2>&1

rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1

if not exist "Z:\home\xuser" (
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\1.components\Winlator dev Tools"
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\6.File manager\Change default wfm for Winlator"
)    

echo msgbox "All processes are done. Changelog is saved in drive D:\Ajay_prefix\wget_files!" , vbInformation+vbSystemModal > %tmp%\tmp.vbs
start "" cscript //nologo %tmp%\tmp.vbs
timeout /t 5
echo done !
taskkill /F /IM cscript.exe /T >nul 2>&1
del %tmp%\tmp.vbs
exit /b

:delete_offline_scripts
echo Removing offline scripts ....
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\2.offline components" >nul 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\3.GPU Test" >nul 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\6.File manager" >nul 2>&1
del /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\install necessary files.bat" >nul 2>&1
goto checked

exit /b
