@echo off
setlocal

:: Kill any existing wfm2.exe process
taskkill /IM wfm2.exe /F >nul 2>&1

:: Ask user for frame rate limit manually
set /p DXVK_FRAME_RATE=Enter frame rate limit (e.g., 60, 120, 0 for unlimited): 

:: HUD info menu
echo.
echo Choose DXVK HUD info:
echo 1. FPS only
echo 2. FPS + GPU Load
echo 3. FPS + Version + API + GPU Load
echo 4. Full info (fps, devinfo, gpuload, version, api, memory)
echo 5. No HUD
echo 6. Custom (manually enter HUD info)
set /p hud_choice=Enter choice (1-6): 

if "%hud_choice%"=="1" set DXVK_HUD=fps
if "%hud_choice%"=="2" set DXVK_HUD=fps,gpuload
if "%hud_choice%"=="3" set DXVK_HUD=fps,version,api,gpuload
if "%hud_choice%"=="4" set DXVK_HUD=fps,devinfo,gpuload,version,api,memory
if "%hud_choice%"=="5" set DXVK_HUD=
if "%hud_choice%"=="6" (
    echo Available HUD options: fps, devinfo, gpuload, version, api, memory
    set /p DXVK_HUD=Enter DXVK HUD info (comma-separated): 
)

:: Display selected options
echo.
echo Terminating any existing wfm2.exe...
echo Frame rate set to: %DXVK_FRAME_RATE%
echo HUD info set to: %DXVK_HUD%
echo.

:: Run the executable
Start "" C:\windows\wfm2.exe"
timeout.exe /t 2 >nul

endlocal