@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
color 1f
echo ==================================
echo ***** Warning: Uninstall other physx version , This is official setup. it can fix some games.
echo ==================================
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
exit

:install
echo.
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp"
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part1.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/PhysX_8.04.25_SystemSoftware.part1.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\PhysX_8.04.25_SystemSoftware.part1.rar %drive_letter%:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part1.rar /E /H /C /I
) ELSE (
    ECHO Part 01 already exists.
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part2.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/PhysX_8.04.25_SystemSoftware.part2.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\PhysX_8.04.25_SystemSoftware.part2.rar %drive_letter%:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part2.rar /E /H /C /I
) ELSE (
    ECHO Part 02 already exists.
)
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f
echo Extracting...
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x %drive_letter%:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part1.rar %drive_letter%:\Ajay_prefix\wget_files\temp\
echo.
echo *** Running the installer ***
timeout.exe /t 3 >nul 2>&1
Start "" /wait %drive_letter%:/Ajay_prefix/wget_files/temp/PhysX_8.04.25_SystemSoftware.exe

timeout.exe /t 3
