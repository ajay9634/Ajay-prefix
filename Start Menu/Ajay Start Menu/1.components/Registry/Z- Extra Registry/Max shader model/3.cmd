@echo off
echo Configuring Wine to use Shader Model 3...
reg add "HKCU\Software\Wine\Direct3D" /v MaxShaderModel /t REG_DWORD /d 3 /f >nul 2>&1
timeout.exe 6 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v MaxShaderModel /t REG_DWORD /d 3 /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo Shader Model 3 has been configured.
exit /b