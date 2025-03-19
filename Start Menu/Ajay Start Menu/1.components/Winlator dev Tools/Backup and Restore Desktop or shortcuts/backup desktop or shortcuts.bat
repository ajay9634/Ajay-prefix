@echo off
set "sevenZipPath=D:\Ajay_prefix\.Resources\7z.exe"
set "outputDir=D:\Ajay_prefix\save_data\winlator_desktop"

:: Check if 7z.exe exists
if not exist "%sevenZipPath%" (
    echo Error: 7z.exe not found at %sevenZipPath%
    pause
    exit /b
)

:: Create output directory if it doesn't exist
if not exist "%outputDir%" (
    mkdir "%outputDir%" >nul 2>&1
    if %errorlevel% neq 0 (
        echo Error: Failed to create directory %outputDir%
        pause
        exit /b
    )
)

:: Archive Icons folder
echo Creating Icons.7z...
"%sevenZipPath%" a "%outputDir%\Icons.7z" "Z:\home\xuser\.local\share\icons\*" -mx9 -mmt -spf2 >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to create Icons.7z
    pause
    exit /b
)

:: Archive Desktop folder
echo Creating Desktop.7z...
"%sevenZipPath%" a "%outputDir%\Desktop.7z" "C:\users\xuser\Desktop\*" -mx9 -mmt -spf2 >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to create Desktop.7z
    pause
    exit /b
)

echo Backup completed successfully.
pause