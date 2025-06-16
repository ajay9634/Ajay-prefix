@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f

echo ==================================
echo ***** Warning: Uninstall other PhysX versions. This is the official setup. It can fix some games. *****
echo ==================================

:choice
echo.
echo *** Now choose an option - ***
echo.
echo 1. Install PhysX-9.21.0713-SystemSoftware
echo 2. Cancel or exit
set "choice="
set /p "choice=Type the number to select an option: "
if not "%choice%"=="" set "choice=%choice:~0,1%"
if "%choice%"=="1" goto install
if "%choice%"=="2" goto cancel
echo "%choice%" is not valid, try again.
echo.
goto choice

:cancel
echo.
echo Installation cancelled.
exit /b

:install
echo.
echo *** Installing PhysX-9.21.0713-SystemSoftware.... ***
echo.
echo *** Script made by Ajay ***
echo.

rmdir /S /Q "%drive_letter%:\Ajay_prefix\wget_files\temp"
mkdir "%drive_letter%:\Ajay_prefix\wget_files\temp"

:: Check if the .din backup file exists
if exist "%drive_letter%:\Ajay_prefix\wget_files\physx\PhysX-9.21.0713-SystemSoftware.din" (
    echo *** Backup file found, now running the installer... ***
    copy "%drive_letter%:\Ajay_prefix\wget_files\physx\PhysX-9.21.0713-SystemSoftware.din" "%drive_letter%:\Ajay_prefix\wget_files\temp\PhysX-9.21.0713-SystemSoftware.exe"
) else (
    echo.
    echo ! Backup file not found, downloading...
    echo.
    wget -q --show-progress -P "%drive_letter%:\Ajay_prefix\wget_files\temp" --progress=dot:mega https://us.download.nvidia.com/Windows/9.21.0713/PhysX_9.21.0713_SystemSoftware.exe
    copy "%drive_letter%:\Ajay_prefix\wget_files\temp\PhysX_9.21.0713_SystemSoftware.exe" "%drive_letter%:\Ajay_prefix\wget_files\physx\PhysX-9.21.0713-SystemSoftware.din"
)

echo.
echo *** installing... ***
echo.

call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
timeout.exe /t 3 >nul 2>&1
start "" /wait "%drive_letter%:\Ajay_prefix\wget_files\temp\PhysX-9.21.0713-SystemSoftware.exe"
echo *******
timeout.exe /t 3
pause
