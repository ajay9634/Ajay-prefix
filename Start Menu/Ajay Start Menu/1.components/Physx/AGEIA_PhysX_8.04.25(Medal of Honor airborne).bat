@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
setlocal EnableDelayedExpansion

set "winrar=%drive_letter%:\Ajay_prefix\.Resources\winrar.exe"
set "sevenzip=C:\Windows\7z.exe"
set "part1=%drive_letter%:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part1.rar"
set "extract_dir=%drive_letter%:\Ajay_prefix\wget_files\temp"

color 0a
color 1f
echo ==============================================================================================
echo ***** Warning: Uninstall other physx version. This is official setup; it can fix some games.
echo ***** Note: Launch Explorer++ to open PhysX launcher.
echo ==============================================================================================
:choice
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. Install PhysX_8.04.25
ECHO 2. Cancel or exit
set choice=
set /p choice=Type the number to select an option-
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install
if '%choice%'=='2' goto cancel
ECHO "%choice%" is not valid, try again
ECHO.
goto choice

:cancel
echo.
ECHO Installation cancelled. 
exit /b

:install
echo.
echo *** Deleting temp files... ***
rmdir /S /Q "%extract_dir%" >nul 2>&1
mkdir "%extract_dir%" >nul 2>&1
echo *** Deleted temp files ***
echo.
echo *** Script made by Ajay ***

color 0A
echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "%part1%" (
    wget -q --show-progress -P "%extract_dir%" --progress=dot:mega ^
    https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/PhysX_8.04.25_SystemSoftware.part1.rar
    copy /s /y "%extract_dir%\PhysX_8.04.25_SystemSoftware.part1.rar" "%part1%" /E /H /C /I
) ELSE (
    echo Part 01 already exists.
)

echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part2.rar" (
    wget -q --show-progress -P "%extract_dir%" --progress=dot:mega ^
    https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/PhysX_8.04.25_SystemSoftware.part2.rar
    copy /s /y "%extract_dir%\PhysX_8.04.25_SystemSoftware.part2.rar" ^
    "%drive_letter%:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part2.rar" /E /H /C /I
) ELSE (
    echo Part 02 already exists.
)

call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f
echo.
echo *** Extracting PhysX archive ***
%winrar% x "%part1%" "%extract_dir%\" -r -y >nul 2>&1

IF EXIST "%extract_dir%\PhysX_8.04.25_SystemSoftware.exe" (
    echo [OK] Extracted using WinRAR
) ELSE (
    echo [!] WinRAR failed, trying 7z.exe...
    %sevenzip% x "%part1%" -o"%extract_dir%" -y >nul 2>&1
    IF EXIST "%extract_dir%\PhysX_8.04.25_SystemSoftware.exe" (
        echo [OK] Extracted using 7z.exe
    ) ELSE (
        echo [X] Extraction failed.
        pause
        exit /b
    )
)

echo.
echo *** Running the installer ***
Start "" "%extract_dir%\PhysX_8.04.25_SystemSoftware.exe"

timeout.exe /t 3 >nul
endlocal
