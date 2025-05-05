@echo off
echo Disabling sound in Wine...
reg add "HKEY_CURRENT_USER\Software\Wine\Drivers" /v Audio /t REG_SZ /d "" /f
if %errorlevel% equ 0 (
    echo Sound disabled successfully.
) else (
    echo Failed to disable sound.
)
timeout.exe /t 4 /nobreak >nul 2>&1
pause