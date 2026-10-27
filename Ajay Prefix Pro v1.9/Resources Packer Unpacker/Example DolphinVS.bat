@echo off
Set PKD=Files.pkd
Set "File=GPU_Test_Pro"
Set "Full_File=Files\%File%.7z"
title %File% Script by Ajay
color 0e
set "line============================================================"
echo %line%
echo      ## DolphinVS dx8 test Script by Ajay ##
echo %line%
echo.
if exist "C:\AJAY_PREFIX_PRO\Apps\GPU Test\DX8DolphinVS" (
    goto Run
    pause
    exit
)

call C:\AJAY_PREFIX_PRO\Ajay_Scripts\Unpacker.bat

:Extract
title %File% Script by Ajay

color 0e
echo [ARC] Extracting
echo.
C:\windows\7z.exe x "C:\Temp\%File%.7z" -o"C:\AJAY_PREFIX_PRO\Apps" -r -y >NUL 2>&1

:Run
echo [INFO] Opening
echo.
set DXVK_HUD=fps,devinfo,gpuload,version,api,memory
Start "" "C:\AJAY_PREFIX_PRO\Apps\GPU Test\DX8DolphinVS\DolphinVS.lnk"
timeout.exe /t 1 >nul
echo %line%
timeout.exe /t 1 >nul
timeout.exe /t 1 >nul
