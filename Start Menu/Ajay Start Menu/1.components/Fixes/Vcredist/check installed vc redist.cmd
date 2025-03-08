@echo off
echo Checking installed Microsoft Visual C++ Redistributables in Wine...
echo.

:: Check Uninstall key (Common for most VC++)
echo Checking: HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "Visual C++" > nul 2>&1 && (
    echo Found in Uninstall key:
    reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /i "Visual C++"
) || echo No VC++ Redistributables found in Uninstall key.

echo.

:: Check MSI Installer registry (VC++ 2005, 2008, 2010, 2012)
echo Checking: HKLM\Software\Classes\Installer\Products
reg query "HKLM\Software\Classes\Installer\Products" /s | findstr /i "Visual C++" > nul 2>&1 && (
    echo Found in MSI Installer key:
    reg query "HKLM\Software\Classes\Installer\Products" /s | findstr /i "Visual C++"
) || echo No VC++ Redistributables found in MSI Installer key.

echo.

:: Check Visual Studio VC Runtimes (2015-2022)
echo Checking: HKLM\Software\Microsoft\VisualStudio
for %%V in (14.0) do (
    reg query "HKLM\Software\Microsoft\VisualStudio\%%V\VC\Runtimes" /s >nul 2>&1 && (
        echo Found Visual C++ %%V runtimes:
        reg query "HKLM\Software\Microsoft\VisualStudio\%%V\VC\Runtimes" /s
    ) || echo No Visual C++ %%V runtimes found.
)

echo.
echo Done.
pause