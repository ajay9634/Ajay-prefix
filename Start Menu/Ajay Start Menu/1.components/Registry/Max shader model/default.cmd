@echo off
echo Deleting Shader Model registry key...
reg delete "HKCU\Software\Wine\Direct3D" /v MaxShaderModel /f >nul 2>&1
timeout.exe 10 /nobreak >nul 2>&1
reg delete "HKCU\Software\Wine\Direct3D" /v MaxShaderModel /f >nul 2>&1
echo Shader Model registry key has been deleted.
exit /b