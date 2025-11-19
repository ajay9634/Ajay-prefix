@echo off
setlocal

taskkill /F /IM autoit3.exe >nul 2>&1
taskkill /F /IM autoit3_x64.exe >nul 2>&1

:: Setup drive
for /f "tokens=2 delims==" %%a in ('findstr /i "SetupFolder=" "%WINDIR%\AjayPrefixConf.txt" 2^>nul') do set "setupfolder=%%a"
for /f "tokens=2 delims==" %%b in ('findstr /i "SaveDataFolder=" "%WINDIR%\AjayPrefixConf.txt" 2^>nul') do set "savedatafolder=%%b"

timeout /t 1 >nul 2>&1

mkdir "%setupfolder%\Ajay_prefix\save_data\users\Registry_backup" 2>nul
mkdir "%setupfolder%\Ajay_prefix\save_data\users\xuser\AppData\Local" 2>nul
mkdir "%setupfolder%\Ajay_prefix\save_data\users\xuser\AppData\Local\Temp" 2>nul
mkdir "%setupfolder%\Ajay_prefix\save_data\users\xuser\AppData\Roaming" 2>nul
mkdir "%setupfolder%\Ajay_prefix\save_data\users\xuser\Documents" 2>nul
mkdir "%setupfolder%\Ajay_prefix\save_data\users\xuser\Documents\My Games" 2>nul
mkdir "%setupfolder%\Ajay_prefix\save_data\users\xuser\Saved Games" 2>nul

timeout /t 2 >nul 2>&1

if not exist "%StartMenuPro%" goto PackageMissing

echo.
echo [ OK ] Downloaded successfully

echo [STEP] Removing old Ajay Start Menu Pro Scripts ...
rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro" >nul 2>&1
del /S /Q /F "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts\*.*" >nul 2>&1
rmdir /S /Q "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Online_Scripts" >nul 2>&1

timeout /t 2 >nul 2>&1

"C:\windows\7z.exe" x "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Ajay_Start_Menu_Pro.7z" -o"C:\AJAY_PREFIX_PRO" -y >nul 2>&1

:ContinueInstall
rmdir /S /Q "C:\temp\AJAY_PREFIX_PRO" 2>nul
echo.
echo [STEP] Installing Updated Ajay Start Menu Pro package ...
"C:\windows\7z.exe" x "C:\temp\Start_Menu_Pro.7z" -p-q-r -o"C:\Temp" -y >nul 2>&1

timeout /t 2 >nul 2>&1

reg query "HKEY_LOCAL_MACHINE\Software\Wine" >nul 2>&1
if errorlevel 1 goto IsWindows

echo [INFO] Wine detected.
echo [INFO] Installing Start Menu for Wine ...
timeout /t 3 >nul 2>&1
"C:\windows\7z.exe" x "C:\temp\Start_Menu_Pro_wine.7z" -p-q-r -o"C:\Temp" -y >nul 2>&1

mkdir "%setupfolder%\Ajay_prefix\wget_files\d3d" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\dsound" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\Game-fixes" 2>nul
goto DoXCopy

:IsWindows
echo [INFO] Windows detected.
timeout /t 3 >nul 2>&1
echo [INFO] Skipping Start Menu ...
goto DoXCopy

:DoXCopy
timeout /t 2 >nul 2>&1

:: === XCOPIES 1: Main Files ===
xcopy /s /y "C:\Temp\AJAY_PREFIX_PRO\" "C:\AJAY_PREFIX_PRO\" /E /H /C /I >nul 2>&1
set "XCOPY1=%ERRORLEVEL%"

if %XCOPY1%==0 goto XCopy1_OK
if %XCOPY1%==1 goto XCopy1_Warn
if %XCOPY1% geq 4 goto XCopy1_Error
goto XCopy1_Abort

:XCopy1_OK
echo Success: Files copied.
goto AfterXCopy1

:XCopy1_Warn
echo Warning: No Start Menu files to copy.
ERROR: Failed to copy Start Menu files  (code %XCOPY2%)
pause
exit /B 1

:XCopy1_Error
cls
echo ERROR: xcopy failed with code %XCOPY1%
echo WARNING: You can't enjoy Latest Start Menu
pause
exit /B 1

:XCopy1_Abort
echo xcopy terminated abnormally (code %XCOPY1%)
pause
exit /B 1

:AfterXCopy1
echo.

timeout /t 2 >nul 2>&1

:: === Check for Wine again for Start Menu copy ===
reg query "HKEY_LOCAL_MACHINE\Software\Wine" >nul 2>&1
if errorlevel 1 goto SkipWineMenu

mkdir "%setupfolder%\Ajay_prefix\wget_files\Files" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\Fixes" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\NET" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\physx" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\temp" 2>nul
mkdir "%setupfolder%\Ajay_prefix\wget_files\my_apps" 2>nul

timeout /t 2 >nul 2>&1

echo [INFO] Copying to Wine Start Menu for Easy Access ...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /v a /d "AjayStartMenuPro" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /v MRUList /d a /f >nul 2>&1

rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu Pro" 2>nul
mkdir "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu Pro" 2>nul

:: === XCOPIES 2: Start Menu Shortcuts ===
xcopy /s /y "C:\Temp\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\" "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu Pro\" /E /H /C /I >nul 2>&1
set "XCOPY2=%ERRORLEVEL%"

if %XCOPY2%==0 goto XCopy2_OK
if %XCOPY2%==1 goto XCopy2_Warn
if %XCOPY2% geq 4 goto XCopy2_Error
goto XCopy2_Abort

:XCopy2_OK
echo Success: Start Menu shortcuts copied.
goto AfterXCopy2

:XCopy2_Warn
echo Warning: No Start Menu files to copy.
ERROR: Failed to copy Start Menu shortcuts to ProgramData (code %XCOPY2%)
goto :EndScript
exit /B 1
pause

:XCopy2_Error
cls
echo ERROR: Failed to copy Start Menu shortcuts to ProgramData (code %XCOPY2%)
echo WARNING: This appears to be a protected directory.
echo Note: This is not a major issue. The Start Menu will appear only in Start Menu Pro Viewer.
echo certain scripts might not function properly because of restrictions.
echo.
echo [INFO] Check the Start Menu for changes by Start Menu Pro Viewer
echo [INFO] Check the Changelog.txt in Misc
timeout /t 5 >nul 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu Pro" 2>nul
goto :EndScript
exit /B 1

:XCopy2_Abort
echo Start Menu copy terminated abnormally (code %XCOPY2%)
pause
exit /B 1

:AfterXCopy2
echo [INFO] Check the Changelog.txt in Misc
:SkipWineMenu
echo [INFO] Check the Start Menu for changes.
echo ----------------------------------------------------------
timeout /t 2 >nul 2>&1

"C:\windows\7z.exe" x "C:\Program Files (x86)\AutoIt3\AutoIt3_exe_backup.7z" -o"C:\Program Files (x86)\AutoIt3" -y >nul 2>&1

echo.
echo [ OK ] Ajay Start Menu Pro Scripts updated successfully!
echo.
echo ----------------------------------------------------------


start "" "C:\Program Files (x86)\AutoIt3\AutoIt3.exe" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\start_menu_message.ajau3"
if exist "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Del_Old_Start_Menu.vbs" start "" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Del_Old_Start_Menu.vbs"

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
endlocal
