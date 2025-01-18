@echo off
echo Setting RenderAPI for Tomb Raider in the registry...

:: Set RenderAPI to dword:00000009
reg add "HKCU\SOFTWARE\Crystal Dynamics\Tomb Raider\Graphics" /v "RenderAPI" /t REG_DWORD /d 9 /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry action silently
reg add "HKCU\SOFTWARE\Crystal Dynamics\Tomb Raider\Graphics" /v "RenderAPI" /t REG_DWORD /d 9 /f >nul 2>&1

echo RenderAPI has been successfully set to 0x00000009.