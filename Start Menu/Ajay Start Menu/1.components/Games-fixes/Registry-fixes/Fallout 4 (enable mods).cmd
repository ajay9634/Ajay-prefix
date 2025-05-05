@echo off
echo Enabling Mods for Fallout 4 in the registry...

:: Set Mods Enabled to true (1)
reg add "HKCU\Software\Bethesda Softworks\Fallout4" /v "bEnableMods" /t REG_DWORD /d 1 /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 6 /nobreak >nul 2>&1

:: Reapply the registry action silently
reg add "HKCU\Software\Bethesda Softworks\Fallout4" /v "bEnableMods" /t REG_DWORD /d 1 /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo Mods have been successfully enabled.
