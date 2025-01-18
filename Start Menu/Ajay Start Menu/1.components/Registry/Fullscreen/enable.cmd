@echo off
echo Setting the "Fullscreen" to "enabled" in the registry...

:: Add or update the registry key silently
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "Fullscreen" /t REG_SZ /d "enabled" /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "Fullscreen" /t REG_SZ /d "enabled" /f >nul 2>&1

echo The registry modification for "Fullscreen" has been applied successfully.
exit
