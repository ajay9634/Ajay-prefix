@echo off
echo Setting the "Multisampling" to "disabled" in the registry...

:: Add or update the registry key silently
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "Multisampling" /t REG_SZ /d "disabled" /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 6 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "Multisampling" /t REG_SZ /d "disabled" /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo The registry modification for "Multisampling" has been applied successfully.
exit
