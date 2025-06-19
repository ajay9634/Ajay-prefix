@echo off
setlocal EnableDelayedExpansion
color 0a

echo ==========================================================
echo     Microsoft Visual C++ Redistributable Installer (x64/x86)
echo     Custom Registry Installer - by Ajay
echo ==========================================================

echo.
echo [INFO] Supported VC++ Versions (2015 to 2022) with Build Numbers:
echo ----------------------------------------------------------------------
echo   Version           , Internal Build   ,  Notes
echo ----------------------------------------------------------------------
echo   14.0.24210.0      ,       24210      , VC++ 2015 RTM
echo   14.0.24215.1      ,       24215      , VC++ 2015 Update 1
echo   14.10.25008.0     ,       25008      , VC++ 2017 RTM
echo   14.11.25325.0     ,       25325      , VC++ 2017 Update
echo   14.12.25810.0     ,       25810      , VC++ 2017 Update
echo   14.13.26020.0     ,       26020      , VC++ 2017 Update
echo   14.14.26405.0     ,       26405      , VC++ 2017 Update
echo   14.16.27012.6     ,       27012      , VC++ 2017 Final
echo   14.20.27508.1     ,       27508      , VC++ 2019 Initial
echo   14.21.27702.2     ,       27702      , VC++ 2019 Update
echo   14.22.27821.0     ,       27821      , VC++ 2019 Update
echo   14.23.27820.0     ,       27820      , VC++ 2019 Update
echo   14.24.28127.4     ,       28127      , VC++ 2019 Update
echo   14.25.28508.3     ,       28508      , VC++ 2019 Stable
echo   14.26.28720.3     ,       28720      , VC++ 2019 Update
echo   14.27.29016.0     ,       29016      , VC++ 2019 Update
echo   14.28.29325.2     ,       29325      , VC++ 2019 Update
echo   14.29.30037.0     ,       30037      , VC++ 2019 Final
echo   14.30.30704.0     ,       30704      , VC++ 2022 Initial
echo   14.31.31103.0     ,       31103      , VC++ 2022 Update
echo   14.32.31326.0     ,       31326      , VC++ 2022 Update
echo   14.33.31629.0     ,       31629      , VC++ 2022 Update
echo   14.34.31931.0     ,       31931      , VC++ 2022 Update
echo   14.35.32215.0     ,       32215      , VC++ 2022 Update
echo   14.36.32532.0     ,       32532      , VC++ 2022 Update
echo   14.37.32822.0     ,       32822      , VC++ 2022 Update
echo   14.38.33130.0     ,       33130      , VC++ 2022 Update
echo   14.39.33519.0     ,       33519      , VC++ 2022 Update
echo   14.40.33705.0     ,       33705      , VC++ 2022 Update
echo   14.41.34025.0     ,       34025      , VC++ 2022 Update
echo   14.42.34267.0     ,       34267      , VC++ 2022 Update
echo   14.43.34822.0     ,       34822      , VC++ 2022 Update
echo   14.44.35208.0     ,       35208      , VC++ 2022 Latest
echo ----------------------------------------------------------------------
echo.

:: === User Input ===
set /p "ver_full=Enter full version (e.g., 14.44.35208.0) [default=14.44.35208.0]: "
if "%ver_full%"=="" set "ver_full=14.44.35208.0"

set /p "ver_bld=Enter internal build number (e.g., 35208) [default=35208]: "
if "%ver_bld%"=="" set "ver_bld=35208"

:: === Extract Rbld safely ===
for /f "tokens=4 delims=." %%a in ("%ver_full%") do (
    set "ver_rbld=%%a"
)
if not defined ver_rbld set "ver_rbld=0"

echo.
echo [INFO] Installing VC++ Registry Entries
echo [INFO] Version       : !ver_full!
echo [INFO] Build Number  : !ver_bld!
echo ==========================================================
echo.

reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Rbld /t REG_DWORD /d !ver_rbld! /f


echo.
echo [INFO] Installing VC++ Registry Entries
echo [INFO] Version       : !ver_full!
echo [INFO] Build Number  : !ver_bld!
echo ==========================================================
echo.

:: === DevDiv Keys (x64 & x86 Minimum + Additional) ===

:: RuntimeAdditional (x64)
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v UpdateVersion /t REG_SZ /d !ver_full! /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Version /t REG_SZ /d !ver_full! /f

:: RuntimeMinimum (x64)
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v UpdateVersion /t REG_SZ /d !ver_full! /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v Version /t REG_SZ /d !ver_full! /f

:: RuntimeAdditional (x86)
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v UpdateVersion /t REG_SZ /d !ver_full! /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Version /t REG_SZ /d !ver_full! /f

:: RuntimeMinimum (x86)
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v UpdateVersion /t REG_SZ /d !ver_full! /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v Version /t REG_SZ /d !ver_full! /f

:: === VC Runtime Runtimes (X64) ===

reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Bld /t REG_DWORD /d !ver_bld! /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Installed /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Major /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Minor /t REG_DWORD /d 44 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Rbld /t REG_DWORD /d !ver_rbld! /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Version /t REG_SZ /d v!ver_full! /f

:: === VC Runtime Runtimes (X86) ===

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Bld /t REG_DWORD /d !ver_bld! /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Installed /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Major /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Minor /t REG_DWORD /d 44 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Rbld /t REG_DWORD /d !ver_rbld! /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Version /t REG_SZ /d v!ver_full! /f

echo.
echo [ OK ] VC++ Registry entries installed for:
echo         Version: !ver_full!
echo         Build  : !ver_bld!
echo.

pause
