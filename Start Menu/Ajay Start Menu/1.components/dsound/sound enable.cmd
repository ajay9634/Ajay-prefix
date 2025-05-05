@echo off
echo Enabling sound in Wine...
reg delete "HKEY_CURRENT_USER\Software\Wine\Drivers" /v Audio /f
if %errorlevel% equ 0 (
    echo Sound enabled successfully.
) else (
    echo Failed to enable sound or no changes were made.
)
timeout.exe /t 4 /nobreak >nul 2>&1
pause