@echo off
setlocal enabledelayedexpansion
color 1F
title Ajay Start Menu Pro Updater
cls
echo ==========================================================
echo               AJAY START MENU PRO UPDATER
echo ==========================================================
echo.

:: Check for Wine environment
reg query "HKEY_LOCAL_MACHINE\Software\Wine" >nul 2>&1
if errorlevel 1 goto Error
goto continue

:Error 
echo [!] ERROR: Wine environment not detected.
echo.
pause
exit

:continue
echo [*] Status: Checking environment...
echo.

:: Clean up temp folders
echo [*] Task: Cleaning temporary files...
Start /wait "C:\Program Files (x86)\AutoIt3\AutoIt3.exe" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Temp_Cleaner.ajau3"

:: Get setup folder info
for /f "tokens=2 delims==" %%a in ('findstr /i "SetupFolder=" "%WINDIR%\AjayPrefixConf.txt" 2^>nul') do set "setupfolder=%%a"
for /f "tokens=2 delims==" %%b in ('findstr /i "SaveDataFolder=" "%WINDIR%\AjayPrefixConf.txt" 2^>nul') do set "savedatafolder=%%b"

Start /wait "C:\Program Files (x86)\AutoIt3\AutoIt3.exe" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Script_Version_Cleaner.ajau3"

rmdir /S /Q "%setupfolder%\Ajay_prefix\Downloaded_Files\temp" >nul 2>&1
mkdir "%setupfolder%\Ajay_prefix\Downloaded_Files\temp" >nul 2>&1
cls
title Ajay Start Menu Pro Updater
cls
echo ==========================================================
echo               AJAY START MENU PRO UPDATER
echo ==========================================================
echo.
echo ----------------------------------------------------------
echo [STEP 1/5] VERSION CHECK
echo ----------------------------------------------------------
rmdir /S /Q C:\Temp\Scripts_Version >nul 2>&1

if not exist "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Version.txt" (
    set "OLD_VER=0.0"
) else (
    set /p OLD_VER=<"C:\AJAY_PREFIX_PRO\Ajay_Scripts\Version.txt"
)

set "Update_URL=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Version.txt"

:: Using Curl for Version Check
echo [*] Checking for updates...

:: 1. Download to a raw temp file first
curl -s -L -o "C:\Temp\version_dl.tmp" "%Update_URL%"

:: 2. Check if the file actually exists before doing anything else
if not exist "C:\Temp\version_dl.tmp" (
    echo [!] ERROR: Download failed. Check your internet connection.
    timeout /t 4 >nul
    pause
    exit
)

:: 3. Now that we know the file is there, prepare the destination
if not exist "C:\Temp\Scripts_Version" mkdir "C:\Temp\Scripts_Version"

:: 4. Copy to destination and clean up
copy /y "C:\Temp\version_dl.tmp" "C:\Temp\Scripts_Version\Version.txt" >nul
del /f /q "C:\Temp\version_dl.tmp" >nul 2>&1

set /p LATEST_VER=<"C:\Temp\Scripts_Version\Version.txt"
echo [+] Current Version  : %OLD_VER%
echo [+] Latest Version   : %LATEST_VER%
echo.

if "%OLD_VER%"=="%LATEST_VER%" (
    echo [*] System is already up to date.
) else (
    echo [*] Update found! Preparing download...
)

set "URL1=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Online_Components.7z"
set "URL2=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Cmd.bat"
set "Online_Components=C:\Temp\Online_Components.7z"

echo.
echo ----------------------------------------------------------
echo [STEP 2/5] DOWNLOADING PACKAGE
echo ----------------------------------------------------------
copy /y "C:\Temp\Scripts_Version\Version.txt" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Version.txt" >nul

:: Download Component 7z via Curl
echo [*] Fetching Online_Components.7z...
curl -s -L -o "C:\Temp\Online_Components.7z" "%URL1%"

:: Download CMD script via Curl
echo [*] Fetching cmd.bat...
curl -s -L -o "C:\Temp\cmd.bat" "%URL2%"

taskkill /F /IM autoit3.exe >nul 2>&1
taskkill /F /IM autoit3_x64.exe >nul 2>&1

if not exist "%Online_Components%" goto PackageMissing

echo [+] Download Complete.
echo.
echo ----------------------------------------------------------
echo [STEP 4/5] CLEANING OLD SCRIPTS
echo ----------------------------------------------------------
del /S /Q /F "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\Online Components\*.*" >nul 2>&1
rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\Online Components" >nul 2>&1
echo [+] Clean-up successful.
echo.

echo ----------------------------------------------------------
echo [STEP 3/5] INSTALLING UPDATE
echo ----------------------------------------------------------
if exist "C:\temp\cmd.bat" (
    echo [*] Running configuration script...
    call C:\temp\cmd.bat
)

echo [*] Extracting package...
"C:\windows\7z.exe" x "C:\temp\Online_Components.7z" -o"C:" -y >nul 2>&1

if errorlevel 1 (
    cls
    color 0C
    echo [!] ERROR: 7-Zip extraction failed.
    pause
    exit
)

echo.
echo ----------------------------------------------------------
echo [SUCCESS] Ajay Start Menu Pro Updated Successfully.
echo ----------------------------------------------------------
echo.

Start /wait "C:\Program Files (x86)\AutoIt3\AutoIt3_x64.exe" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\done_message.ajau3"

goto EndScript

:PackageMissing
cls
color 0C
echo.
echo ----------------------------------------------------------
echo [!] CRITICAL ERROR: Download Failed
echo [!] Online_Components.7z is missing. Curl failed to download the package.
echo ----------------------------------------------------------
echo.
pause

:EndScript
timeout /t 3 >nul
endlocal