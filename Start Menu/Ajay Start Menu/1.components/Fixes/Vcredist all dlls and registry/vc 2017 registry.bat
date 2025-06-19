@echo off
setlocal EnableDelayedExpansion
color 0a

echo ==========================================================
echo      Microsoft Visual C++ 2017 Redistributable (x64/x86)
echo      Registry Installer - by Ajay
echo      Version: 14.16.27033.0
echo ==========================================================

:: === DevDiv Keys ===

reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v UpdateVersion /t REG_SZ /d 14.16.27033.0 /f
reg add "HKLM\SOFTWARE\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Version /t REG_SZ /d 14.16.27033.0 /f

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v UpdateVersion /t REG_SZ /d 14.16.27033.0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeAdditional" /v Version /t REG_SZ /d 14.16.27033.0 /f

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v Install /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v InstallerType /t REG_SZ /d MSI /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SP /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SPIndex /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v SPName /t REG_SZ /d RTM /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v UpdateVersion /t REG_SZ /d 14.16.27033.0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC\Servicing\14.0\RuntimeMinimum" /v Version /t REG_SZ /d 14.16.27033.0 /f

:: === VC Runtime Runtimes (X64) ===

reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Bld /t REG_DWORD /d 27033 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Installed /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Major /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Minor /t REG_DWORD /d 16 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Rbld /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Version /t REG_SZ /d v14.16.27033.0 /f

:: === VC Runtime Runtimes (X86) ===

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Bld /t REG_DWORD /d 27033 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Installed /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Major /t REG_DWORD /d 14 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Minor /t REG_DWORD /d 16 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Rbld /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Version /t REG_SZ /d v14.16.27033.0 /f

echo.
echo [ OK ] VC++ 2017 registry installed (x64 + x86).
echo.

pause