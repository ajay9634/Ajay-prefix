@echo off
echo Configuring dinput , dinput8 and xinput dlls overrides to use builtin,native versions in the registry...

:: Set dinput to builtin,native
reg add "HKCU\Software\Wine\DllOverrides" /v "dinput" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set dinput8 to builtin,native
reg add "HKCU\Software\Wine\DllOverrides" /v "dinput8" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set xinput1_1 to builtin,native
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_1" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set xinput1_2 to builtin,native
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_2" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set xinput1_3 to builtin,native
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_3" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set xinput1_4 to builtin,native
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_4" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set xinput9_1_0 to builtin,native
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput9_1_0" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Set xinputuap to builtin,native
reg add "HKCU\Software\Wine\DllOverrides" /v "xinputuap" /t REG_SZ /d "builtin,native" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "dinput" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "dinput8" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_1" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_2" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_3" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_4" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput9_1_0" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinputuap" /t REG_SZ /d "builtin,native" /f >nul 2>&1

echo DLL overrides have been successfully configured to use builtin,native versions
