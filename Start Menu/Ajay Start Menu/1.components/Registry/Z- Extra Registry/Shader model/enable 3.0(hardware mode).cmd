@echo off
echo Setting "VertexShaderMode" to "hardware" in the registry...

:: Add or update the VertexShaderMode key silently
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VertexShaderMode" /t REG_SZ /d "hardware" /f >nul 2>&1

:: Wait for 10 seconds silently
timeout.exe /t 6 /nobreak >nul 2>&1

:: Reapply the registry setting after the delay
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "VertexShaderMode" /t REG_SZ /d "hardware" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo The registry modification for "VertexShaderMode" has been applied successfully.
exit
