@echo off
echo Clearing the "winegstreamer" value in the registry...

:: Add or update the registry key silently
reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "winegstreamer" /t REG_SZ /d "" /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "winegstreamer" /t REG_SZ /d "" /f >nul 2>&1

echo The registry modification for "winegstreamer" has been applied successfully.
exit
