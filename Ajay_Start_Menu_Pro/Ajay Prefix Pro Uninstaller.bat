@echo off
setlocal enabledelayedexpansion

title Ajay Prefix Pro Uninstaller

:: --- 1. CONFIGURATION ---
set "BACKUP_DIR=C:\AJAY_PREFIX_PRO\Backup"
set "MAIN_DIR=C:\AJAY_PREFIX_PRO"
set "MAIN_SUB=C:\AJAY_PREFIX_PRO\Ajay_Scripts"
set "MAIN_SUB2=C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro"
set "VBS_TEMP=%temp%\ajay_msg.vbs"
set "HKCU_ShellKey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"

:: --- 2. VBSCRIPT CONFIRMATION ---
echo x = MsgBox("Are you sure you want to uninstall Ajay Prefix Pro and restore system settings?", 4 + 32, "Ajay Prefix Pro Uninstaller") > "%VBS_TEMP%"
echo If x = 7 Then WScript.Quit 1 >> "%VBS_TEMP%"

cscript //nologo "%VBS_TEMP%"
if %errorlevel% neq 0 (
    del "%VBS_TEMP%"
    exit /b
)

:: --- 3. SAFETY CHECK: REGISTRY BACKUPS ---
if not exist "%BACKUP_DIR%\*.reg" (
    echo MsgBox "Uninstallation Aborted: Registry backup files not found in %BACKUP_DIR%.", 16, "Error" > "%VBS_TEMP%"
    cscript //nologo "%VBS_TEMP%"
    del "%VBS_TEMP%"
    exit /b
)

:: --- 4. IMPORT REGISTRY BACKUPS ---

echo [RESTORE] Importing Backup Registry
    reg import "%BACKUP_DIR%\HKCU_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKCU_UserShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_UserShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_WOW6432Node_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_WOW6432Node_UserShellFolders.reg" >nul 2>&1
    timeout /t 1 >nul
    timeout /t 1 >nul
    timeout /t 1 >nul
    timeout /t 1 >nul
    reg import "%BACKUP_DIR%\HKCU_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKCU_UserShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_UserShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_WOW6432Node_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_WOW6432Node_UserShellFolders.reg" >nul 2>&1
    timeout /t 1 >nul
    timeout /t 1 >nul
    timeout /t 1 >nul
    timeout /t 1 >nul
    reg import "%BACKUP_DIR%\HKCU_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKCU_UserShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_UserShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_WOW6432Node_ShellFolders.reg" >nul 2>&1
    reg import "%BACKUP_DIR%\HKLM_WOW6432Node_UserShellFolders.reg" >nul 2>&1
    timeout /t 1 >nul
    timeout /t 1 >nul
    timeout /t 1 >nul
    timeout /t 1 >nul

:: Check for existing Ajay_prefix
for /f "tokens=2,*" %%A in ('reg query "%HKCU_ShellKey%" /v Personal 2^>nul') do set "CurrentPath=%%B"
if defined CurrentPath (
    echo %CurrentPath% | findstr /i "Ajay_prefix" >nul
    if not errorlevel 1 (
        echo [ERROR] Couldn't Import Backup Registry
        echo Uninstaller failed to Uninstall Ajay Prefix Pro 
        echo.
        echo msgbox "Uninstaller failed to import backup registry, Existing.", 16+4096, "Status" > "%tmp%\tmp.vbs"
        start /b wscript //nologo "%tmp%\tmp.vbs"
        pause
        exit
    )
) else (
    echo [ERROR] Could not read Documents path from registry.
    echo msgbox "[ERROR] Could not read Documents path from registry, Exiting.", 16+4096, "Status" > "%tmp%\tmp.vbs"
    start /b wscript //nologo "%tmp%\tmp.vbs"
    timeout /t 1 >nul
    exit /b
)
echo [INFO] Current Documents Path: %CurrentPath%


:: --- 5. REGISTRY CLEANUP (Added Keys) ---
echo [INFO] Cleaning up application registry keys...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Launcher.exe" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Backup.exe" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Launcher2.exe" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\AjayStartMenuPro.exe" /f >nul 2>&1
reg delete "HKCR\7-Zip.archive" /f >nul 2>&1
reg delete "HKCU\Software\7-Zip" /f >nul 2>&1
reg delete "HKCU\Software\7-Zip-Zstandard" /f >nul 2>&1
reg delete "HKCR\txtfile" /f >nul 2>&1
reg delete "HKCU\Software\Explorer++" /f >nul 2>&1

:: --- 6. DELETE SYSTEM FILES (C:\Windows) ---
echo [INFO] Removing files from system directory...
pushd %windir%
del /f /q AjayPrefixConf.txt wfm2.exe 7za.exe 7-zip.chm 7-zip32.dll 7-zip.dll lz5.dll lz4.dll flzma2.dll lizard.dll 7zCon.sfx 7z.sfx 7z.exe 7z1.exe 7zG.exe 7zxa.dll zstd.dll 7zFM.exe brotli.dll 7za.dll 7z.dll Explorer++.exe descript.ion timeout.exe >nul 2>&1
popd

wget -q -P "C:\Temp" "https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Uninstaller.bat" >nul 2>&1

if exist "C:\Temp\Uninstaller.bat" (
    call "C:\Temp\Uninstaller.bat"
) else (
    >"%TEMP%\_aj_msgbox.vbs" echo MsgBox "Some registry entries could not be removed due to no internet connection.", vbExclamation + vbSystemModal, "Uninstallation Issue"
    cscript //nologo "%TEMP%\_aj_msgbox.vbs"
    del "%TEMP%\_aj_msgbox.vbs" 2>nul
)

:: --- 7. REMOVE FOLDERS AND FILES ---
echo [INFO] Removing folders...
rd /s /q "%windir%\Lang" >nul 2>&1
rd /s /q "%ProgramData%\Microsoft\Windows\Start Menu\Ajay Start Menu Pro" >nul 2>&1
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Ajay_Start_Menu_Pro_Viewer.lnk" >nul 2>&1
rd /s /q "%ProgramFiles(x86)%\AutoIt3" >nul 2>&1
rd /s /q "C:\temp" >nul 2>&1
rd /s /q "%MAIN_SUB%" >nul 2>&1
rd /s /q "%MAIN_SUB2%" >nul 2>&1
rd /s /q "%MAIN_DIR%" >nul 2>&1
:: --- 8. SUCCESS MESSAGE ---
echo MsgBox "Ajay Prefix Pro has been successfully uninstalled.", 64, "Success" > "%VBS_TEMP%"
cscript //nologo "%VBS_TEMP%"
del "%VBS_TEMP%"

exit /b
