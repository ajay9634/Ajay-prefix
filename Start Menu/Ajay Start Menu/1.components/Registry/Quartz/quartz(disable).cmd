@echo off
echo Disabling Quartz in the registry...

:: Set Quartz to disabled
reg add "HKCU\Software\Wine\DllOverrides" /v "quartz" /t REG_SZ /d "disabled" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "quartz" /t REG_SZ /d "disabled" /f >nul 2>&1

echo Quartz has been successfully disabled.
