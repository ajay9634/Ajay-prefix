@echo off
echo Setting the "ColorDepth" to "32" (32-bit color depth) in the registry...

:: Add or update the registry key silently
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "ColorDepth" /t REG_SZ /d "32" /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "ColorDepth" /t REG_SZ /d "32" /f >nul 2>&1

echo The registry modification for 32-bit color depth has been applied successfully.
exit
