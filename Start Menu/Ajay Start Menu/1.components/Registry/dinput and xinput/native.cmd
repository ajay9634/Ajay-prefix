@echo off
echo Configuring DLL overrides to use native,builtin versions in the registry...

:: Set dinput to native,builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "dinput" /t REG_SZ /d "native,builtin" /f >nul 2>&1

:: Set dinput8 to native,builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "dinput8" /t REG_SZ /d "native,builtin" /f >nul 2>&1

:: Set xinput1_1 to native,builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_1" /t REG_SZ /d "native,builtin" /f >nul 2>&1

:: Set xinput1_2 to native,builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_2" /t REG_SZ /d "native,builtin" /f >nul 2>&1

:: Set xinput1_3 to native,builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_3" /t REG_SZ /d "native,builtin" /f >nul 2>&1

:: Set xinput1_4 to native,builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_4" /t REG_SZ /d "native,builtin" /f >nul 2>&1

:: Set xinput9_1_0 to native,builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput9_1_0" /t REG_SZ /d "native,builtin" /f >nul 2>&1

:: Set xinputuap to native,builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "xinputuap" /t REG_SZ /d "native,builtin" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "dinput" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "dinput8" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_1" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_2" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_3" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput1_4" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinput9_1_0" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xinputuap" /t REG_SZ /d "native,builtin" /f >nul 2>&1

echo DLL overrides have been successfully configured to use native,builtin versions.
