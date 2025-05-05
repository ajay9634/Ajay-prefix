@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f
echo ==================================
echo ***** Warning: Uninstall other physx version , This is official setup. it can fix some games.
echo ==================================
:choice 
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. Install PhysX-9.13.0604-SystemSoftware-Legacy
ECHO 2. Cancel or exit
set choice=
set /p choice=Type the number to select an option.
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
ECHO *** installing PhysX-9.13.0604-SystemSoftware-Legacy....***
echo.
echo *** Script made by Ajay ***
echo.
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp"
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"

:: Check if the .din backup file exists
IF EXIST "%drive_letter%:/Ajay_prefix/wget_files/physx/PhysX-9.13.0604-SystemSoftware-Legacy.din" (
    ECHO *** backup file found, Now running the installer...***
    copy "%drive_letter%:/Ajay_prefix/wget_files/physx/PhysX-9.13.0604-SystemSoftware-Legacy.din" "%drive_letter%:/Ajay_prefix/wget_files/temp/PhysX-9.13.0604-SystemSoftware-Legacy.msi"
) ELSE (
    echo.
    ECHO ! backup file not found, downloading...
    echo.
    wget -q --show-progress -P "%drive_letter%:/Ajay_prefix/wget_files/temp/" --progress=dot:mega https://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi
    copy "%drive_letter%:/Ajay_prefix/wget_files/temp/PhysX-9.13.0604-SystemSoftware-Legacy.msi" "%drive_letter%:/Ajay_prefix/wget_files/physx/PhysX-9.13.0604-SystemSoftware-Legacy.din"
    echo.
    ECHO *** Download complete, installing...**"
    echo.
)

:: Run the installer
Start /wait %drive_letter%:/Ajay_prefix/wget_files/temp/PhysX-9.13.0604-SystemSoftware-Legacy.msi

ECHO *******
exit
