@echo off
echo Configuring msxml DLL overrides in the registry...

:: Set msxml3 to builtin, native
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml3" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set msxml3r to builtin, native
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml3r" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set msxml4 to builtin, native
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml4" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set msxml4r to builtin, native
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml4r" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set msxml6 to builtin, native
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml6" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set msxml6r to builtin, native
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml6r" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 6 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml3" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml3r" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml4" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml4r" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml6" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "msxml6r" /t REG_SZ /d "builtin,native" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo msxml DLL overrides have been successfully configured.