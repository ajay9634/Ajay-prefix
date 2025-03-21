@echo off
echo Disabling DLL overrides in the registry...

:: Set ngen.exe to disabled
reg add "HKCU\Software\Wine\DllOverrides" /v "ngen.exe" /t REG_SZ /d "disabled" /f >nul 2>&1

:: Set regsvcs.exe to disabled
reg add "HKCU\Software\Wine\DllOverrides" /v "regsvcs.exe" /t REG_SZ /d "disabled" /f >nul 2>&1

:: Set mscorsvw.exe to disabled
reg add "HKCU\Software\Wine\DllOverrides" /v "mscorsvw.exe" /t REG_SZ /d "disabled" /f >nul 2>&1

:: Set fusion to disabled
reg add "HKCU\Software\Wine\DllOverrides" /v "fusion" /t REG_SZ /d "disabled" /f >nul 2>&1

:: Set mscoree to disabled
reg add "HKCU\Software\Wine\DllOverrides" /v "mscoree" /t REG_SZ /d "disabled" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "ngen.exe" /t REG_SZ /d "disabled" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "regsvcs.exe" /t REG_SZ /d "disabled" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "mscorsvw.exe" /t REG_SZ /d "disabled" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "fusion" /t REG_SZ /d "disabled" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "mscoree" /t REG_SZ /d "disabled" /f >nul 2>&1

echo DLL overrides have been successfully disabled
