@echo off
echo Enabling GLSL in Wine's Direct3D settings...
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "UseGLSL" /t REG_SZ /d "enabled" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "UseGLSL" /t REG_SZ /d "enabled" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo GLSL setting has been enabled successfully.
exit