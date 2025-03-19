@echo off
set "outputDir=D:\Ajay_prefix\save_data\winlator_desktop"
set "iconsArchive=%outputDir%\Icons.7z"
set "desktopArchive=%outputDir%\Desktop.7z"

:: Check if either archive exists
if not exist "%iconsArchive%" if not exist "%desktopArchive%" (
    echo No archives found to delete.
    pause
    exit /b
)

:: Confirmation prompt
echo The following archives will be deleted:
if exist "%iconsArchive%" echo - Icons.7z
if exist "%desktopArchive%" echo - Desktop.7z

set /p "confirm=Are you sure you want to delete these files? (Y/N): "
if /i "%confirm%" neq "Y" (
    echo Operation canceled.
    pause
    exit /b
)

:: Delete archives with confirmation
if exist "%iconsArchive%" (
    del /f /q "%iconsArchive%" >nul 2>&1
    echo Icons.7z deleted successfully.
)

if exist "%desktopArchive%" (
    del /f /q "%desktopArchive%" >nul 2>&1
    echo Desktop.7z deleted successfully.
)

echo Deletion completed.
pause