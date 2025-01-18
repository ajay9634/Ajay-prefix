@echo off
echo Setting "strict_shader_math" to "dword:00000003" in the registry...

:: Add or update the strict_shader_math key as a DWORD silently
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "strict_shader_math" /t REG_DWORD /d 3 /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "strict_shader_math" /t REG_DWORD /d 3 /f >nul 2>&1

echo The registry modification for "strict_shader_math" has been applied successfully.
exit
