@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1E
mkdir "%LOCALAPPDATA%\Temp" >NUL 2>&1
mkdir "%Temp%" >NUL 2>&1

title Ajay Start Menu installation
echo [INFO] Don't close this window!

:: Kill archive tools if running
taskkill /F /IM 7z.exe /T >NUL 2>&1
taskkill /F /IM winrar.exe /T >NUL 2>&1

echo [INFO] Checking ".Resources" files ...

:: Check if offline resource exists
if not exist "%drive_letter%:\Ajay_prefix\.Resources\Resources.7z" (
echo msgbox " Looks like Ajay prefix offline files are missing from D drive." , vbinformation+vbSystemModal > %tmp%\tmp.vbs
    cscript //nologo %tmp%\tmp.vbs
    del %tmp%\tmp.vbs
    goto delete_offline_scripts
) else (
    echo [INFO] Resources.7z found.
)

:: checking Ajay prefix offline files update status
set "toolpath=%drive_letter%:\Ajay_prefix\.Resources\7z.exe"
set "archive=%drive_letter%:\Ajay_prefix\.Resources\Start_Menu.7z"
set "password=-p-q"
set "expected_file=10.18.final.fix.txt"

REM Check if expected file is inside the archive (quietly)
"%toolpath%" l "%archive%" %password% 2>nul | findstr /I /C:"%expected_file%" >nul 2>&1
if errorlevel 1 (
    echo.
    echo [INFO] Looks like you're using an outdated version of the Ajay prefix.
    echo [INFO] Please download the latest version from Ajay's GitHub.
    echo [INFO] The latest version 10.18_final_fix was uploaded on 7 may 2025.
    echo msgbox "You're using an outdated version of the Ajay prefix. Please download the latest version from Ajay's GitHub." , vbInformation+vbSystemModal > "%tmp%\tmp.vbs"
    cscript //nologo "%tmp%\tmp.vbs"
    del "%tmp%\tmp.vbs"
) else (
    echo [INFO] Ajay prefix offline files are up to date.
    goto necessary_files
)

:necessary_files
echo [INFO] Updating some offline scripts and necessary files...

:: Download the archive
wget -q -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/offline_scripts_update.7z

:: Check if download succeeded
if exist "%drive_letter%:\Ajay_prefix\wget_files\temp\offline_scripts_update.7z" (
    echo [INFO] Cleaning up old Start Menu ...
    rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*offline components*" >nul 2>&1
    rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*GPU Test*" >nul 2>&1
    del /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\install necessary files.bat" >NUL 2>&1
    del /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\Check_Ajay_prefix_status.bat" >NUL 2>&1
    rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*Backup and Restore*" >nul 2>&1
    rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*export and import*" >nul 2>&1
    rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*Install custom files*" >nul 2>&1

    echo [INFO] Extracting latest Start Menu...
    %drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\temp\offline_scripts_update.7z -oC:\ -p-q -r -y >NUL 2>&1
) else (
    echo ERROR: Download failed or file does not exist. Skipping cleanup and extraction.
)

:checked
set "updatefile=%drive_letter%:\Ajay_prefix\.Resources\update2.7z"
if not exist "C:\windows\curl.exe" set "missing=1"
if not exist "C:\windows\7-zip32.dll" set "missing=1"

if defined missing (
    echo [INFO] Required files missing. Preparing update...
    rmdir C:\windows\temp\update >nul 2>&1
    mkdir C:\windows\temp\update >nul 2>&1

    if exist "%updatefile%" (
        echo [INFO] update2.7z found. Extracting directly...
    ) else (
        echo [INFO] Downloading update2.7z...
        wget -q --show-progress -P "%drive_letter%:/Ajay_prefix/wget_files/temp/" --progress=dot:mega ^
        https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/update2.7z
        xcopy /s /y "%drive_letter%:\Ajay_prefix\wget_files\temp\update2.7z" "%drive_letter%:\Ajay_prefix\.Resources\" /E /H /C /I >NUL 2>&1
    )

    %drive_letter%:\Ajay_prefix\.Resources\7z.exe x "%updatefile%" -oC:\windows\temp\update\ -p-q -r -y >NUL 2>&1
    echo [INFO] *** Installing... ***
    xcopy /s /y C:\windows\temp\update\ C:\ /E /H /C /I >NUL 2>&1
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

if exist "C:\windows\timeout.exe" (
    copy /Y "C:\windows\timeout.exe" "C:\windows\system32\timeout.exe" >nul 2>&1
)

cls
echo [INFO] Adding wfm2 registry to open folders and drives

reg add "HKEY_CLASSES_ROOT\Folder\shell\open\command" /ve /d "C:\\windows\\wfm2.exe \"%%1\"" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\Drive\shell\open\command" /ve /d "C:\\windows\\wfm2.exe \"%%1\"" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\shell\open\command" /ve /d "C:\\windows\\wfm2.exe \"%%1\"" /f >nul 2>&1

@echo off
cls
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

:: Ajay prefix folder path check
set "RegistryKey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
set "RegistryValue=Personal"
set "ExpectedData=%drive_letter%:\Ajay_prefix\save_data\users\xuser\Documents"

reg query "%RegistryKey%" /v "%RegistryValue%" | find "%ExpectedData%" >nul 2>&1
if %errorlevel%==0 (
    goto check
) else (
    goto done
)

:check
:: Check if Ajay_prefix Version is 10.18_final
reg query "HKCU\Software\Ajay_prefix" /v Version 2>nul | find "10.18_final" >nul 2>&1
if %errorlevel%==0 (
    goto done
) else (
    goto install
)

:install

if exist "C:\windows\temp\Ajay-prefix-main\cmd.bat" (
    echo [ Updating Ajay Prefix Registry ]
    call "C:\windows\temp\Ajay-prefix-main\cmd.bat"
)

:done
timeout /t 1 >NUL 2>&1
timeout /t 1 >NUL 2>&1

echo [INFO] Please wait...
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
rmdir /S /Q "C:/windows/temp/Ajay-prefix-main/Start Menu" >NUL 2>&1

timeout /t 2 >NUL 2>&1
if not exist "Z:\home\xuser" (
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\1.components\Winlator dev Tools"
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\6.File manager\Change default wfm for Winlator"
)
echo [INFO] done !
echo msgbox "All processes are done. Changelog is saved in drive %drive_letter%:\Ajay_prefix\wget_files!" , vbInformation+vbSystemModal > %tmp%\tmp.vbs
start "" cscript //nologo %tmp%\tmp.vbs
timeout /t 1 >NUL 2>&1
timeout /t 1 >NUL 2>&1
timeout /t 1 >NUL 2>&1
timeout /t 1 >NUL 2>&1
timeout /t 1 >NUL 2>&1
timeout /t 1 >NUL 2>&1
taskkill /F /IM cscript.exe /T >nul 2>&1
del %tmp%\tmp.vbs
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
if exist "%drive_letter%:\Ajay_prefix\wget_files\Changelog.txt" (
    start "" notepad.exe "%drive_letter%:\Ajay_prefix\wget_files\Changelog.txt"
)
timeout /t 1 >NUL 2>&1
timeout /t 1 >NUL 2>&1
exit /b

:delete_offline_scripts
echo [INFO] Removing offline scripts ....
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\2.offline components" >nul 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\3.GPU Test" >nul 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\6.File manager" >nul 2>&1
del /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\install necessary files.bat" >nul 2>&1
goto checked

exit /b
