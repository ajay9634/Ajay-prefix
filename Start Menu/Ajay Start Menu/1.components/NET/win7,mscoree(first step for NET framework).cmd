@echo off
echo Configuring Wine registry settings...

:: Set ngen.exe to native
reg add "HKCU\Software\Wine\DllOverrides" /v "ngen.exe" /t REG_SZ /d "native" /f >nul 2>&1

:: Set regsvcs.exe to builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "regsvcs.exe" /t REG_SZ /d "builtin" /f >nul 2>&1

:: Set mscorsvw.exe to builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "mscorsvw.exe" /t REG_SZ /d "builtin" /f >nul 2>&1

:: Set fusion to builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "fusion" /t REG_SZ /d "builtin" /f >nul 2>&1

:: Set mscoree to native
reg add "HKCU\Software\Wine\DllOverrides" /v "mscoree" /t REG_SZ /d "native" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout /t 10 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "ngen.exe" /t REG_SZ /d "native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "regsvcs.exe" /t REG_SZ /d "builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "mscorsvw.exe" /t REG_SZ /d "builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "fusion" /t REG_SZ /d "builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "mscoree" /t REG_SZ /d "native" /f >nul 2>&1

:: Set Wine version to Windows 7
reg add "HKCU\Software\Wine" /v "Version" /t REG_SZ /d "win7" /f >nul 2>&1

echo Wine registry settings have been successfully configured.