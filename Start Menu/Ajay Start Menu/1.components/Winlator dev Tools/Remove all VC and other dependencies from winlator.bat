@echo off
color 1f
echo don't disconnect internet ..
:: Ensure the destination folder exists
if not exist "Z:\home\xuser\.wine\.update-timestamp" (
    echo ERROR: You aren't using winlator ! Operation canceled.
    pause
    exit /b
)

:: Copy and replace .update-timestamp
wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/.update-timestamp

if not exist "D:/Ajay_prefix/wget_files/temp/.update-timestamp" (
    echo ERROR: Operation canceled ! Make sure you're connected to internet !
    pause
    exit /b
)
copy /Y "D:/Ajay_prefix/wget_files/temp/.update-timestamp" "Z:\home\xuser\.wine\" >nul 2>&1

echo Deleting all Visual C++ Redistributables, installed software, installer data, and dependencies from the registry...

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DevDiv\VC" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC" /f >nul 2>&1

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /f >nul 2>&1

:: Delete Installer UserData (CAUTION: This removes MSI installer records)
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData" /f >nul 2>&1

:: Delete Installer Dependencies (WARNING: This removes shared installation dependencies)
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Dependencies" /f >nul 2>&1

:: Delay for safety
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply deletions silently
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DevDiv\VC" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\DevDiv\VC" /f >nul 2>&1

:: Delete all installed software from the registry again
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /f >nul 2>&1

:: Delete Installer UserData again
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData" /f >nul 2>&1

:: Delete Installer Dependencies again
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Dependencies" /f >nul 2>&1

echo Registry cleanup completed successfully.
echo removing all dlls from syswow64 and system32
del C:\windows\system32\*.dll /Q
del C:\windows\syswow64\*.dll /Q

echo done
cls
echo Now restart the container !
pause
