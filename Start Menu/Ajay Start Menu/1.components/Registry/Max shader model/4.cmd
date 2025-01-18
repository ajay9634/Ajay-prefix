@echo off
echo Configuring Wine to use Shader Model 4...
reg add "HKCU\Software\Wine\Direct3D" /v MaxShaderModel /t REG_DWORD /d 4 /f >nul 2>&1
timeout.exe 10 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v MaxShaderModel /t REG_DWORD /d 4 /f >nul 2>&1
echo Shader Model 4 has been configured.
exit /b