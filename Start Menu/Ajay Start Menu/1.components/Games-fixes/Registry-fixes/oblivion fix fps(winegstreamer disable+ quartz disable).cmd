@echo off
echo Disabling DLL overrides for quartz and winegstreamer in the registry...

:: Disable quartz override (set to empty)
reg add "HKCU\Software\Wine\DllOverrides" /v "quartz" /t REG_SZ /d "" /f >nul 2>&1

:: Disable winegstreamer override (set to empty)
reg add "HKCU\Software\Wine\DllOverrides" /v "winegstreamer" /t REG_SZ /d "" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "quartz" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "winegstreamer" /t REG_SZ /d "" /f >nul 2>&1

echo DLL overrides for quartz and winegstreamer have been successfully disabled.