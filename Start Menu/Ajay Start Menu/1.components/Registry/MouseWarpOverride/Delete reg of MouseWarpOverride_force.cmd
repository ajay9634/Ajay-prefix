@echo off
echo Deleting the "MouseWarpOverride" value from the registry...

:: Delete the registry value silently
reg delete "HKEY_CURRENT_USER\Software\Wine\DirectInput" /v "MouseWarpOverride" /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the deletion after the delay
reg delete "HKEY_CURRENT_USER\Software\Wine\DirectInput" /v "MouseWarpOverride" /f >nul 2>&1

echo The "MouseWarpOverride" value has been successfully deleted from the registry.
exit
