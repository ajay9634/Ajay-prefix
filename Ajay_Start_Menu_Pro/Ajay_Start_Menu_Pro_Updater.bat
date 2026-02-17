@echo off
setlocal

taskkill /F /IM autoit3.exe >nul 2>&1
taskkill /F /IM autoit3_x64.exe >nul 2>&1

:: Setup drive
for /f "tokens=2 delims==" %%a in ('findstr /i "SetupFolder=" "%WINDIR%\AjayPrefixConf.txt" 2^>nul') do set "setupfolder=%%a"
for /f "tokens=2 delims==" %%b in ('findstr /i "SaveDataFolder=" "%WINDIR%\AjayPrefixConf.txt" 2^>nul') do set "savedatafolder=%%b"

set "RegistryKey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
set "RegistryValue=Personal"
set "ExpectedData=%savedatafolder%\Ajay_prefix\save_data\users\xuser\Documents"

for /f "tokens=2,*" %%A in ('reg query "%RegistryKey%" /v %RegistryValue% 2^>nul') do (
    set "CurrentPath=%%B"
)

if not exist "%setupfolder%\Ajay_prefix\save_data\users\Registry_backup" mkdir "%setupfolder%\Ajay_prefix\save_data\users\Registry_backup"
if not exist "%setupfolder%\Ajay_prefix\save_data\users\xuser\AppData\Local\Temp" mkdir "%setupfolder%\Ajay_prefix\save_data\users\xuser\AppData\Local\Temp"
if not exist "%setupfolder%\Ajay_prefix\save_data\users\xuser\Documents\My Games" mkdir "%setupfolder%\Ajay_prefix\save_data\users\xuser\Documents\My Games"

timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1

if not exist "%StartMenuPro%" goto PackageMissing

echo.
echo [ OK ] Downloaded successfully
echo [STEP 3/4] Removing old Ajay Start Menu Pro Scripts ...
rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro" >nul 2>&1
del /S /Q /F "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts\*.*" >nul 2>&1
rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts" >nul 2>&1

timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1

:ContinueInstall
rmdir /S /Q "C:\temp\AJAY_PREFIX_PRO" 2>nul
echo.
echo ----------------------------------------------------------
echo [STEP 4/4] Installing Updated Ajay Start Menu Pro package ...
"C:\windows\7z.exe" x "C:\temp\Start_Menu_Pro.7z" -p-q-r -o"C:\Temp" -y >nul 2>&1

timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1

reg query "HKEY_LOCAL_MACHINE\Software\Wine" >nul 2>&1
if errorlevel 1 goto IsWindows

echo [INFO] Wine detected.
echo [INFO] Installing Start Menu for Wine ...
timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1
"C:\windows\7z.exe" x "C:\temp\Start_Menu_Pro_wine.7z" -p-q-r -o"C:\Temp" -y >nul 2>&1
timeout /t 1 >nul 2>&1
xcopy /s /y "C:\Temp\windows\" "C:\windows\" /E /H /C /I >nul 2>&1

mkdir "%setupfolder%\Ajay_prefix\wget_files\d3d" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\dsound" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\Game-fixes" 2>nul
goto DoXCopy

:IsWindows
echo [INFO] Windows detected.
timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1
echo [INFO] Skipping Most Start Menu ...
echo msgbox "Windows detected. For the first time setup: please copy your AppData and other important folders to %SaveDataFolder%\Ajay_prefix\.. (You can safely ignore this message if you've already done this).", 64 + 4096, "First-time Setup Notification" > "%tmp%\tmp.vbs"
start /b wscript //nologo "%tmp%\tmp.vbs"

timeout /t 1 /nobreak >nul
timeout /t 1 /nobreak >nul
timeout /t 1 /nobreak >nul
del /f /q "%tmp%\tmp.vbs"
goto DoXCopy

:DoXCopy
timeout /t 1 >nul 2>&1
if not exist "Z:\home\xuser" (
    rmdir /S /Q "C:\Temp\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\6. Misc And Apps\SymLink Tools\SymLink Folders of Winlator" >nul 2>&1
)

timeout /t 1 >nul 2>&1
:: === XCOPIES 1: Main Files ===
xcopy /s /y "C:\Temp\AJAY_PREFIX_PRO\" "C:\AJAY_PREFIX_PRO\" /E /H /C /I >nul 2>&1
set "XCOPY1=%ERRORLEVEL%"

if %XCOPY1%==0 goto XCopy1_OK
if %XCOPY1%==1 goto XCopy1_Warn
if %XCOPY1% geq 4 goto XCopy1_Error
goto XCopy1_Abort

:XCopy1_OK
echo Success: Files copied to Main Location.
echo [INFO] Now You can enjoy Ajay Start Menu Pro by Viewer.
goto AfterXCopy1

:XCopy1_Warn
echo Warning: No Start Menu files to copy.
echo ERROR: Failed to copy Ajay Start Menu Pro files  (code %XCOPY1%)
rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro" >nul 2>&1
del /S /Q /F "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts\*.*" >nul 2>&1
rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts" >nul 2>&1
"C:\windows\7z.exe" x "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Ajay_Start_Menu_Pro.7z" -o"C:\AJAY_PREFIX_PRO" -y >nul 2>&1
pause
exit /B 1

:XCopy1_Error
echo ERROR: xcopy failed with code %XCOPY1%
goto :alternate_method
pause
exit /B 1

:XCopy1_Abort
echo xcopy terminated abnormally (code %XCOPY1%)
goto :alternate_method
pause
exit /B 1

:alternate_method
echo.
echo Trying alternate method by 7zip ...
"C:\windows\7z.exe" a "C:\temp\Temp_Start_Menu.7z" "C:\Temp\AJAY_PREFIX_PRO\*" -y >nul 2>&1

if errorlevel 1 (
    echo [ERROR] 7-Zip failed to compress Start Menu files.
    rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro" >nul 2>&1
    del /S /Q /F "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts\*.*" >nul 2>&1
    rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts" >nul 2>&1
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu Pro" 2>nul
    "C:\windows\7z.exe" x "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Ajay_Start_Menu_Pro.7z" -o"C:\AJAY_PREFIX_PRO" -y >nul 2>&1
    echo msgbox "7-Zip Error: Failed to compress Start Menu files.", 16, "Error" > "%tmp%\7zerr.vbs"
    wscript //nologo "%tmp%\7zerr.vbs"
    timeout /t 1 >nul 2>&1
    timeout /t 1 >nul 2>&1
    del /f /q "%tmp%\7zerr.vbs"
    pause
    exit /B 1
)

timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1

"C:\windows\7z.exe" x "C:\temp\Temp_Start_Menu.7z" -o"C:\AJAY_PREFIX_PRO" -y >nul 2>&1

if errorlevel 1 (
    rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro" >nul 2>&1
    del /S /Q /F "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts\*.*" >nul 2>&1
    rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts" >nul 2>&1
    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu Pro" 2>nul
    "C:\windows\7z.exe" x "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Ajay_Start_Menu_Pro.7z" -o"C:\AJAY_PREFIX_PRO" -y >nul 2>&1
    echo [ERROR] 7-Zip failed to extract Start Menu files to C:\AJAY_PREFIX_PRO
    echo msgbox "7-Zip Error: Failed to extract Start Menu files to destination.", 16, "Error" > "%tmp%\7zerr.vbs"
    wscript //nologo "%tmp%\7zerr.vbs"
    timeout /t 1 >nul 2>&1
    timeout /t 1 >nul 2>&1
    del /f /q "%tmp%\7zerr.vbs"
    pause
    exit /B 1
)

goto AfterXCopy1


:AfterXCopy1
echo.

timeout /t 1 >nul 2>&1

:: === Check for Wine again for Start Menu copy ===
reg query "HKEY_LOCAL_MACHINE\Software\Wine" >nul 2>&1
if errorlevel 1 goto SkipWineMenu

mkdir "%setupfolder%\Ajay_prefix\wget_files\Files" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\Fixes" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\NET" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\physx" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\temp" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\my_apps" 2>nul

timeout /t 1 >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /v a /d "AjayStartMenuPro.exe" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /v MRUList /d a /f >nul 2>&1

rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu Pro" 2>nul
mkdir "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu Pro" 2>nul

:AfterXCopy2
echo.

if exist "C:\windows\wfm.bat" (
    copy /y "C:\Temp\temp\wfm.bat" "C:\windows\wfm.bat" >nul 2>nul
)

if exist "C:\windows\Update_Check.bat" (
    copy /y "C:\Temp\temp\Update_Check.bat" "C:\windows\Update_Check.bat" >nul 2>nul
)


echo ----------------------------------------------------------
echo [INFO] Check the Changelog.txt in Misc
:SkipWineMenu
echo [INFO] Check the Start Menu for changes.
echo.
echo ==========================================================
timeout /t 1 >nul 2>&1

"C:\windows\7z.exe" x "C:\Program Files (x86)\AutoIt3\AutoIt3_exe_backup.7z" -o"C:\Program Files (x86)\AutoIt3" -y >nul 2>&1

echo.
echo [ OK ] Ajay Start Menu Pro Scripts updated successfully!
echo.
echo ==========================================================


start /wait "" "C:\Program Files (x86)\AutoIt3\AutoIt3_x64.exe" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\start_menu_message.ajau3"
if exist "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Del_Old_Start_Menu.vbs" start "" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Del_Old_Start_Menu.vbs"

reg query "HKEY_LOCAL_MACHINE\Software\Wine" >nul 2>&1
if errorlevel 1 goto EndScript
echo ----------------------------------------------------------
echo [INFO] Confirmation message about Installing to ProgramData...
echo ----------------------------------------------------------
start "" "C:\Program Files (x86)\AutoIt3\AutoIt3_x64.exe" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Install2ProgramData.ajau3"
goto EndScript

:PackageMissing
cls
echo.
color 0C
echo [ERROR] Ajay Start Menu Pro package not found.
echo.
echo [INFO ] Download may have failed. Check internet and retry.

:EndScript
echo.
timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1
timeout /t 1 >nul 2>&1
endlocal
