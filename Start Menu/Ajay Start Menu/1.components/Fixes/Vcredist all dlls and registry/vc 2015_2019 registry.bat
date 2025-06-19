@echo off
setlocal EnableDelayedExpansion
color 0a

echo ==========================================================
echo     Microsoft Visual C++ 2015-2019 Redistributable (x64/x86)
echo     Registry Installer - by Ajay
echo     Version: 14.25.28508
echo ==========================================================

:: === DevDiv Detection (x64 & x86) ===
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v UpdateVersion /t REG_SZ /d 14.25.28508 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Version /t REG_SZ /d 14.25.28508 /f

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v UpdateVersion /t REG_SZ /d 14.25.28508 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Version /t REG_SZ /d 14.25.28508 /f

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v UpdateVersion /t REG_SZ /d 14.25.28508 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v Version /t REG_SZ /d 14.25.28508 /f

:: === VisualStudio Runtimes x64 ===
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Bld /t REG_DWORD /d 28444 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Installed /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Major /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Minor /t REG_DWORD /d 25 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Rbld /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Version /t REG_SZ /d v14.25.28508.03 /f

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Bld /t REG_DWORD /d 28444 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Installed /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Major /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Minor /t REG_DWORD /d 25 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Rbld /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Version /t REG_SZ /d v14.25.28508.03 /f

:: === VisualStudio Runtimes x86 ===
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Bld /t REG_DWORD /d 28444 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Installed /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Major /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Minor /t REG_DWORD /d 25 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Rbld /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Version /t REG_SZ /d v14.25.28508.03 /f

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Bld /t REG_DWORD /d 28444 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Installed /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Major /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Minor /t REG_DWORD /d 25 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Rbld /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Version /t REG_SZ /d v14.25.28508.03 /f

echo.
echo [ OK ] VC++ 2015-2019 registry installed (x64 + x86).
pause
exit /b