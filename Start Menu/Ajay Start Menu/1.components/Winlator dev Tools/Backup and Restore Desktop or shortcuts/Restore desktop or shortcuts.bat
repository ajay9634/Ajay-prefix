@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
set "sevenZipPath=%drive_letter%:\Ajay_prefix\.Resources\7z.exe"
set "backupDir=%drive_letter%:\Ajay_prefix\save_data\winlator_desktop"
set "iconsArchive=%backupDir%\Icons.7z"
set "desktopArchive=%backupDir%\Desktop.7z"

:: Check if 7z.exe exists
if not exist "%sevenZipPath%" (
    echo Error: 7z.exe not found at %sevenZipPath%
    exit /b
)

:: Restore Icons folder
if exist "%iconsArchive%" (
    echo Restoring Icons folder...
    "%sevenZipPath%" x "%iconsArchive%" -o"Z:\" -y >nul 2>&1
    if %errorlevel% neq 0 (
        echo Error: Failed to restore Icons folder.
        exit /b
    )
) else (
    echo Warning: Icons.7z not found. Skipping icons restore.
)

:: Restore Desktop folder
if exist "%desktopArchive%" (
    echo Restoring Desktop folder...
    "%sevenZipPath%" x "%desktopArchive%" -o"C:\" -y >nul 2>&1
    if %errorlevel% neq 0 (
        echo Error: Failed to restore Desktop folder.
        exit /b
    )
) else (
    echo Warning: Desktop.7z not found. Skipping desktop restore.
)

echo Restore completed successfully.
pause