@echo off
echo Setting "FontSmoothing" to "4" and "LogPixels" to "dword:00000093" in the registry...

:: Add or update the FontSmoothing key silently
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "4" /f >nul 2>&1

:: Add or update the LogPixels key as a DWORD silently
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LogPixels" /t REG_DWORD /d 147 /f >nul 2>&1

:: Wait for 8 seconds silently
timeout.exe /t 8 /nobreak >nul 2>&1

:: Reapply the registry settings after the delay
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "4" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LogPixels" /t REG_DWORD /d 147 /f >nul 2>&1

timeout.exe /t 8 /nobreak >nul 2>&1

:: Reapply the registry settings after the delay
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "4" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LogPixels" /t REG_DWORD /d 147 /f >nul 2>&1

timeout.exe /t 8 /nobreak >nul 2>&1

:: Reapply the registry settings after the delay
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "4" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LogPixels" /t REG_DWORD /d 147 /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo The registry modifications have been applied successfully.
cls
echo now restart the container !
pause
