@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title dgVoodoo2 Installer by Ajay
color 0a

call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

set "installname=dgVoodoo2_81_3"
set "ZIPPATH=%drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%.zip"
set "TEMPDIR=C:\windows\temp"
set "WRAR=%drive_letter%:\Ajay_prefix\.Resources\winrar.exe"
set "SEVENZ=C:\Windows\7z.exe"
set "VBSNAME=select_folder.vbs"
set "VBSPATH=%TEMPDIR%\%VBSNAME%"
set "FOLDER_OUT=%TEMPDIR%\selected_path.txt"

echo ==========================================================
echo [STEP] Cleaning up old temp files...
echo ----------------------------------------------------------
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >nul 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"
rmdir /S /Q "%TEMPDIR%" >nul 2>&1
mkdir "%TEMPDIR%" >nul 2>&1
del /f /q "%FOLDER_OUT%" >nul 2>&1
del /f /q "%VBSPATH%" >nul 2>&1
del /f /q "C:\windows\system32\dgVoodooCpl.exe" >nul 2>&1
del /f /q "C:\windows\syswow64\dgVoodooCpl.exe" >nul 2>&1
del /f /q "C:\windows\syswow64\dgVoodoo.conf" >nul 2>&1
del /f /q "C:\windows\system32\dgVoodoo.conf" >nul 2>&1
echo [ OK  ] Temp files removed
echo.

echo ==========================================================
echo [STEP] Downloading %installname%.zip if not already downloaded
echo ----------------------------------------------------------
IF NOT EXIST "%ZIPPATH%" (
    wget -q --show-progress -P "%drive_letter%:/Ajay_prefix/wget_files/temp/" ^
    https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/%installname%.zip
    copy /Y "%drive_letter%:\Ajay_prefix\wget_files\temp\%installname%.zip" "%ZIPPATH%" >nul
    echo [ OK  ] ZIP downloaded and copied
) ELSE (
    echo [SKIP] ZIP already exists: %installname%.zip
)
echo.

echo ==========================================================
echo [STEP] Extracting archive...
echo ----------------------------------------------------------
%WRAR% x "%ZIPPATH%" "%TEMPDIR%\" -r -y >nul 2>&1
IF ERRORLEVEL 1 (
    echo [WARN] WinRAR failed. Trying 7-Zip...
    "%SEVENZ%" x "%ZIPPATH%" -o"%TEMPDIR%" -y >nul
    IF ERRORLEVEL 1 (
        echo [ERROR] Extraction failed using both tools.
        timeout /t 5
        exit /b 1
    )
)
echo [ OK  ] Extraction successful
del /s /f /q "C:\windows\temp\d3d9.dll"
echo.
cls
echo ==========================================================
echo [STEP] Choose where to install %installname% files ( ddraw.dll , d3d8.dll and nglide dlls ) -
echo ----------------------------------------------------------
echo [1] Install to SysWOW64
echo [2] Install to a Game Folder (choose manually)
echo.
set /p choice="[CHOICE] Enter 1 or 2: "

if /i "%choice%"=="1" (
    echo [INFO] Installing to SysWOW64...
    xcopy /y "%TEMPDIR%\MS\x86\*.*" "C:\Windows\SysWOW64\" >nul
    xcopy /y "%TEMPDIR%\3dfx\x86\*.*" "C:\Windows\SysWOW64\" >nul
    echo [ OK  ] Files copied to SysWOW64
    echo [INFO] Opening conf ...
    echo MsgBox "Change dgvoodoo.conf location to Roaming ", vbInformation, "dgVoodoo Config Reminder" > "%TEMP%\msgbox.vbs"
wscript "%TEMP%\msgbox.vbs"
del /f /q "%TEMP%\msgbox.vbs" >nul
    Start "" "%TEMPDIR%\dgvoodooCpl.exe"
    goto :end
)

if /i "%choice%"=="2" (
    echo ==========================================================
    echo [STEP] Launching folder picker via prebuilt VBS
    echo ----------------------------------------------------------

    if exist "C:\ProgramData\Temp\%VBSNAME%" (
        copy /y "C:\ProgramData\Temp\%VBSNAME%" "%VBSPATH%" >nul
    ) else (
        echo [ERROR] Missing prebuilt VBS: %VBSNAME%
        timeout /t 2
        exit /b 1
    )

    echo [INFO] Launching GUI folder picker...
    wscript "%VBSPATH%"

    if exist "%FOLDER_OUT%" (
        for /f "usebackq delims=" %%A in ("%FOLDER_OUT%") do (
            set "RAWPATH=%%A"
        )
        set "GAMEFOLDER=!RAWPATH!"
        echo [INFO] Folder path read: [!GAMEFOLDER!]

        if not exist "!GAMEFOLDER!" (
            echo [ERROR] Selected folder is invalid or missing.
            timeout /t 2 >nul
            exit /b 1
        )
        xcopy /y "%TEMPDIR%\MS\x86\*.*" "!GAMEFOLDER!\" >nul
        xcopy /y "%TEMPDIR%\3dfx\x86\*.*" "!GAMEFOLDER!\" >nul
        xcopy /y "%TEMPDIR%\dgvoodooCpl.exe" "!GAMEFOLDER!\" >nul
        echo [ OK  ] Files copied to game folder
        echo [INFO] Opening conf ...
        echo MsgBox "Change dgvoodoo.conf location to Roaming ", vbInformation, "dgVoodoo Config Reminder" > "%TEMP%\msgbox.vbs"
wscript "%TEMP%\msgbox.vbs"
del /f /q "%TEMP%\msgbox.vbs" >nul
        Start "" "!GAMEFOLDER!\dgvoodooCpl.exe"
    ) else (
        echo [WARN] Folder picker failed or was cancelled.
        set /p GAMEFOLDER=Enter game folder path manually - e.g. F:\Games :
        if not exist "!GAMEFOLDER!" (
            echo [ERROR] Folder not found. Aborting.
            timeout /t 2
            exit /b 1
        )
        xcopy /y "%TEMPDIR%\MS\x86\*.*" "!GAMEFOLDER!\" >nul
        xcopy /y "%TEMPDIR%\3dfx\x86\*.*" "!GAMEFOLDER!\" >nul
        xcopy /y "%TEMPDIR%\dgvoodooCpl.exe" "!GAMEFOLDER!\" >nul
        echo [ OK  ] Files copied to manually entered path
        echo [INFO] Opening conf ...
        echo MsgBox "Change dgvoodoo.conf location to Roaming ", vbInformation, "dgVoodoo Config Reminder" > "%TEMP%\msgbox.vbs"
wscript "%TEMP%\msgbox.vbs"
del /f /q "%TEMP%\msgbox.vbs" >nul
        Start "" "!GAMEFOLDER!\dgvoodooCpl.exe"
    )

    echo [INFO] Cleaning up...
    del /f /q "%VBSPATH%" >nul 2>&1
    del /f /q "%FOLDER_OUT%" >nul 2>&1
    goto :end
)

echo [ERROR] Invalid choice. Please run the script again.
pause
exit /b

:end
echo.
echo ==========================================================
echo [DONE] dgVoodoo2 (%installname%) has been installed.
echo You may now run dgVoodooCpl.exe or test with a game.
echo ==========================================================
timeout /t 3 >nul
exit /b