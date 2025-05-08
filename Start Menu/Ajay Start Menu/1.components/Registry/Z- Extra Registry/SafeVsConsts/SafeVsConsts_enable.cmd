@echo off
echo Setting the "SafeVsConsts" to "enabled" in the registry...

:: Add or update the registry key silently
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "SafeVsConsts" /t REG_SZ /d "enabled" /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 6 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "SafeVsConsts" /t REG_SZ /d "enabled" /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo The registry modification for "SafeVsConsts" has been applied successfully.
exit
