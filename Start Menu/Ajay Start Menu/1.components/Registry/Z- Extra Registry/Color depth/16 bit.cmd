@echo off
echo Setting the "ColorDepth" to "16" in the registry...

:: Add or update the registry key silently
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "ColorDepth" /t REG_SZ /d "16" /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 6 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "ColorDepth" /t REG_SZ /d "16" /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo The registry modification has been applied successfully.
exit
