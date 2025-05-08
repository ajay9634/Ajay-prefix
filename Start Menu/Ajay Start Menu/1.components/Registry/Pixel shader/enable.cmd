@echo off
echo Enabling Pixel Shader in Wine registry...
reg add "HKCU\Software\Wine\Direct3D" /v PixelShaderMode /t REG_SZ /d enabled /f >nul 2>&1
timeout.exe 6 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\Direct3D" /v PixelShaderMode /t REG_SZ /d enabled /f >nul 2>&1
timeout.exe 4 /nobreak >nul 2>&1
echo Pixel Shader has been enabled.
exit /b