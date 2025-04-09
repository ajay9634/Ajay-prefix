@echo off
color 1f
echo ==================================
echo ***** Warning: Uninstall other physx version , This is official setup. it can fix some games.
echo ==================================
:choice 
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. Install PhysX-9.21.0713-SystemSoftware
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
ECHO *** installing PhysX-9.21.0713-SystemSoftware....***
echo.
echo *** Script made by Ajay ***
echo.
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"

:: Check if the .din backup file exists
IF EXIST "D:/Ajay_prefix/wget_files/physx/PhysX-9.21.0713-SystemSoftware.din" (
    ECHO *** backup file found, Now running the installer...***
    copy "D:/Ajay_prefix/wget_files/physx/PhysX-9.21.0713-SystemSoftware.din" "D:/Ajay_prefix/wget_files/temp/PhysX-9.21.0713-SystemSoftware.exe"
Start /wait D:/Ajay_prefix/wget_files/temp/PhysX-9.21.0713-SystemSoftware.exe
) ELSE (
    echo.
    ECHO ! backup file not found, downloading...
    echo.
    wget -q --show-progress -P "D:/Ajay_prefix/wget_files/temp/" --progress=dot:mega  https://us.download.nvidia.com/Windows/9.21.0713/PhysX_9.21.0713_SystemSoftware.exe
    copy "D:/Ajay_prefix/wget_files/temp/PhysX_9.21.0713_SystemSoftware.exe" "D:/Ajay_prefix/wget_files/physx/PhysX-9.21.0713-SystemSoftware.din"
    
    echo.
    ECHO *** Download complete, installing...**"
    echo.
Start /wait D:/Ajay_prefix/wget_files/temp/PhysX_9.21.0713_SystemSoftware.exe

)

ECHO *******
exit
