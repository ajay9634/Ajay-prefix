@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
color 1f
echo ==============================================================================================
echo       Microsoft Visual C+ 2005-2022 Redistributable (x64/x86) with missing dlls
echo        Installer - by Ajay
echo       dlls credits - VisualCppRedist_AIO_x86_x64.exe
echo ==============================================================================================
echo ***** Note: Install vc registry after this
echo ==============================================================================================
:choice
echo.


:install1
echo.
echo *** deleting temp files...***
rmdir /S /Q "C:\windows\temp"
mkdir "C:\windows\temp"
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\redist.part1.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/redist.part1.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\redist.part1.rar %drive_letter%:\Ajay_prefix\wget_files\Files\redist.part1.rar /E /H /C /I
) ELSE (
    ECHO Part 01 already exists.
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\redist.part2.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/redist.part2.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\redist.part2.rar %drive_letter%:\Ajay_prefix\wget_files\Files\redist.part2.rar /E /H /C /I
) ELSE (
    ECHO Part 02 already exists.
)
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f
echo Extracting...
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\redist.part1.rar C:\windows\temp
echo.
:choice
echo *** Now choose an option - ***
echo.
ECHO 1. Install all vcredist dlls as skip
ECHO 2. Install all vcredist dlls as force
ECHO 3. Cancel or exit
set choice=
set /p choice=Type the number to select an option-
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install1
if '%choice%'=='2' goto install2
if '%choice%'=='3' goto cancel
ECHO "%choice%" is not valid, try again
ECHO.
goto choice

:cancel
echo.
ECHO Installation cancelled. 
exit

:install1

xcopy "C:\windows\temp\system32\" "C:\Windows\System32\" /E /Y /D /H /C /I
xcopy "C:\windows\temp\syswow64\" "C:\Windows\SysWOW64\" /E /Y /D /H /C /I
goto registry

:install2

xcopy "C:\windows\temp\system32\" "C:\Windows\System32\" /E /Y /H /C /I
xcopy "C:\windows\temp\syswow64\" "C:\Windows\SysWOW64\" /E /Y /H /C /I
goto registry

:registry

echo updating registry...
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{14E469E0-BF61-11CF-8385-8F69D8F1350B}" /ve /d "AsyncProperty_VB5" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{14E469E0-BF61-11CF-8385-8F69D8F1350B}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{14E469E0-BF61-11CF-8385-8F69D8F1350B}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{2CE46480-1A08-11CF-AD63-00AA00614F3E}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{2CE46480-1A08-11CF-AD63-00AA00614F3E}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{41A7D760-6018-11CF-9016-00AA0068841E}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{41A7D760-6018-11CF-9016-00AA0068841E}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{41A7D761-6018-11CF-9016-00AA0068841E}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{41A7D761-6018-11CF-9016-00AA0068841E}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{45046D60-08CA-11CF-A90F-00AA0062BB4C}" /ve /d "PropertyBag_VB5" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{45046D60-08CA-11CF-A90F-00AA0062BB4C}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{45046D60-08CA-11CF-A90F-00AA0062BB4C}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{888A5A60-B283-11CF-8AD5-00A0C90AEA82}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{888A5A60-B283-11CF-8AD5-00A0C90AEA82}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{A4C466B8-499F-101B-BB78-00AA00383CBB}\TypeLib" /v Version /d "6.0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{A4C46780-499F-101B-BB78-00AA00383CBB}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{B28FA150-0FF0-11CF-A911-00AA0062BB4C}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{B28FA150-0FF0-11CF-A911-00AA0062BB4C}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{BE8F9800-2AAA-11CF-AD67-00AA00614F3E}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{BE8F9800-2AAA-11CF-AD67-00AA00614F3E}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{C0324960-2AAA-11CF-AD67-00AA00614F3E}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{C0324960-2AAA-11CF-AD67-00AA00614F3E}\TypeLib" /v Version /d "6.0" /f >nul 2>&1

reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{D4E0F020-720A-11CF-8136-00AA00C14959}\TypeLib" /ve /d "{EA544A21-C82D-11D1-A3E4-00A0C90AEA82}" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{D4E0F020-720A-11CF-8136-00AA00C14959}\TypeLib" /v Version /d "6.0" /f >nul 2>&1
echo.
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\all_vcredist_dlls" /v "DisplayName" /t REG_SZ /d "all_vcredist_dlls" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\all_vcredist_dlls" /v "UninstallString" /t REG_SZ /d "rundll32.exe" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\all_vcredist_dlls" /v "DisplayVersion" /t REG_SZ /d "1.0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\all_vcredist_dlls" /v "Publisher" /t REG_SZ /d "Ajay Prefix" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\all_vcredist_dlls" /v "InstallLocation" /t REG_SZ /d "C:\\windows\\system32" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\all_vcredist_dlls" /v "DisplayIcon" /t REG_SZ /d "C:\\windows\\system32\\shell32.dll" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\all_vcredist_dlls" /v "NoModify" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\all_vcredist_dlls" /v "NoRepair" /t REG_DWORD /d 1 /f >nul 2>&1

echo ************************************************
echo           Installation complete.
echo ************************************************
timeout /t 5 /nobreak >NUL
