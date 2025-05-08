@echo off
echo Setting the "MouseWarpOverride" to "enable" in the registry...

:: Add or update the registry key silently
reg add "HKEY_CURRENT_USER\Software\Wine\DirectInput" /v "MouseWarpOverride" /t REG_SZ /d "enable" /f >nul 2>&1

:: Wait for 6 seconds silently
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\DirectInput" /v "MouseWarpOverride" /t REG_SZ /d "enable" /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo The registry modification for "MouseWarpOverride" has been applied successfully.
exit
