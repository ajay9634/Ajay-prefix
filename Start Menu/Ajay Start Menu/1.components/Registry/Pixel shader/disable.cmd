@echo off
echo Disabling Pixel Shader in Wine registry...
reg add "HKCU\Software\Wine\Direct3D" /v PixelShaderMode /t REG_SZ /d disabled /f >nul 2>&1
timeout.exe 10 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v PixelShaderMode /t REG_SZ /d disabled /f >nul 2>&1
echo Pixel Shader has been disabled.
exit /b