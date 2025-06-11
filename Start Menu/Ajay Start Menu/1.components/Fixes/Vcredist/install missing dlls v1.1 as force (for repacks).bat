@echo off
color 0E
echo Note: This may cause issues with certain games, but it can help fix errors that occur during repack installations.
echo.
:: Ask user to continue using SET /P
set /p user_choice="Do you want to continue with the installation? (Y/N): "
if /i not "%user_choice%"=="Y" (
    echo Installation aborted.
    goto :eof
)

:: Load drive letter from external script
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

echo.
color 0A
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:\Ajay_prefix\wget_files\temp" >NUL 2>&1
mkdir "%drive_letter%:\Ajay_prefix\wget_files\temp" >NUL 2>&1
del /F /Q /A "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls.7z" >NUL 2>&1
del /F /Q /A "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.0.7z" >NUL 2>&1

echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Downloading DLLs
color 0A
echo.
echo *** Downloading Missing_dlls ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.1.7z" (
    wget -q --show-progress -P "%drive_letter%:\Ajay_prefix\wget_files\temp\" --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Missing_dlls_v1.1.7z
    copy /s /y "%drive_letter%:\Ajay_prefix\wget_files\temp\Missing_dlls_v1.1.7z" "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.1.7z" /E /H /C /I
) ELSE (
    ECHO Missing_dlls file already exists.
)

:: Extracting and installing
color 1f
echo.
echo *** Extracting ...***
"%drive_letter%:\Ajay_prefix\.Resources\7z.exe" x "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.1.7z" -o"%drive_letter%:\Ajay_prefix\wget_files\temp\" -p-q -r -y >NUL 2>&1

echo *** installing...***
xcopy "%drive_letter%:\Ajay_prefix\wget_files\temp\system32\" "C:\Windows\System32\" /E /Y /H /C /I
xcopy "%drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\" "C:\Windows\SysWOW64\" /E /Y /H /C /I

echo.
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Missing_dlls" /v "DisplayName" /t REG_SZ /d "Missing_dlls" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Missing_dlls" /v "UninstallString" /t REG_SZ /d "rundll32.exe" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Missing_dlls" /v "DisplayVersion" /t REG_SZ /d "1.1" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Missing_dlls" /v "Publisher" /t REG_SZ /d "Ajay Prefix" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Missing_dlls" /v "InstallLocation" /t REG_SZ /d "C:\\windows\\system32" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Missing_dlls" /v "DisplayIcon" /t REG_SZ /d "C:\\windows\\system32\\shell32.dll" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Missing_dlls" /v "NoModify" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Missing_dlls" /v "NoRepair" /t REG_DWORD /d 1 /f >nul 2>&1

echo ************************************************
echo           Installation complete.
echo ************************************************
timeout /t 5 /nobreak >NUL
