@echo off
echo Setting RenderTargetLockMode to locked in Wine...

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "RenderTargetLockMode" /t REG_SZ /d "locked" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

echo RenderTargetLockMode has been set to locked successfully in Wine.
exit