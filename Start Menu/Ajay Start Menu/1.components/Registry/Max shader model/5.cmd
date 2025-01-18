@echo off
echo Configuring Wine to use Shader Model 5...
reg add "HKCU\Software\Wine\Direct3D" /v MaxShaderModel /t REG_DWORD /d 5 /f >nul 2>&1
timeout.exe 10 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v MaxShaderModel /t REG_DWORD /d 5 /f >nul 2>&1
echo Shader Model 5 has been configured.
exit /b