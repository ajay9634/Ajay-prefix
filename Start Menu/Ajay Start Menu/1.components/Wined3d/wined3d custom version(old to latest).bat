@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
setlocal EnableDelayedExpansion

set "winrar=%drive_letter%:\Ajay_prefix\.Resources\winrar.exe"
set "sevenzip=C:\Windows\7z.exe"
set "temp64=C:\windows\temp\system32"
set "temp32=C:\windows\temp\syswow64"
set "d3dpath=%drive_letter%:\Ajay_prefix\wget_files\d3d"

color 0a
echo *** downloding wined3d from `https://fdossena.com` , VPN maybe needed. ***
echo.
set installname=wined3d-
echo Enter wined3d version (eg 10.3 or 10.3-staging ) ( Note - Minimum value limit 1.6.2 for only syswow64 and 1.7.53 for system32 + syswow64 )
echo.
set /p version=Enter version: 
echo Version set to %version%

echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:\Ajay_prefix\wget_files\temp" >NUL 2>&1
rmdir /S /Q "C:\windows\temp" >NUL 2>&1
mkdir "C:\windows\temp" >NUL 2>&1
mkdir "%drive_letter%:\Ajay_prefix\wget_files\temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

color 0A
echo.
echo *** Downloading wined3d-%version% x64 ***
if not exist "%d3dpath%\%installname%%version%_64.zip" (
    wget -q --show-progress -P C:\windows\temp\ ^
        https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%version%-x86_64.zip
    ren C:\windows\temp\WineD3DForWindows_%version%-x86_64.zip %installname%%version%_64.zip
    copy "C:\windows\temp\%installname%%version%_64.zip" "%d3dpath%\%installname%%version%_64.zip"
)

echo Extracting x64 DLLs...
%winrar% e -y "%d3dpath%\%installname%%version%_64.zip" "%temp64%\" *.dll >nul 2>&1
if exist "%temp64%\d3d9.dll" (
    echo [OK] Extracted with WinRAR
) else (
    echo [!] WinRAR failed, trying 7z...
    %sevenzip% e "%d3dpath%\%installname%%version%_64.zip" -o"%temp64%" -y >nul 2>&1
    if exist "%temp64%\d3d9.dll" (
        echo [OK] Extracted with 7z
    ) else (
        echo [X] Failed to extract x64 DLLs
        pause
        exit /b
    )
)
echo Installing 64-bit DLLs...
xcopy /s /y "%temp64%\" "C:\windows\system32\" /E /H /C /I

color 0A
echo.
echo *** Downloading wined3d-%version% x86 ***
if not exist "%d3dpath%\%installname%%version%.zip" (
    wget -q --show-progress -P C:\windows\temp\ ^
        https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%version%.zip
    ren C:\windows\temp\WineD3DForWindows_%version%.zip %installname%%version%.zip
    copy "C:\windows\temp\%installname%%version%.zip" "%d3dpath%\%installname%%version%.zip"
)

echo Extracting x86 DLLs...
%winrar% e -y "%d3dpath%\%installname%%version%.zip" "%temp32%\" *.dll >nul 2>&1
if exist "%temp32%\d3d9.dll" (
    echo [OK] Extracted with WinRAR
) else (
    echo [!] WinRAR failed, trying 7z...
    %sevenzip% e "%d3dpath%\%installname%%version%.zip" -o"%temp32%" -y >nul 2>&1
    if exist "%temp32%\d3d9.dll" (
        echo [OK] Extracted with 7z
    ) else (
        echo [X] Failed to extract x86 DLLs
        pause
        exit /b
    )
)
echo Installing 32-bit DLLs...
xcopy /s /y "%temp32%\" "C:\windows\syswow64\" /E /H /C /I

timeout.exe 5 /nobreak
endlocal
