@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
set "installname=dgvoodoo2-v2.64"
:: Remove the prefix "dxvk-" and keep the part after it
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp"
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"
del "C:\windows\system32\dgVoodooCpl.exe" >NUL 2>&1
del "C:\windows\syswow64\dgVoodooCpl.exe" >NUL 2>&1
del "C:\windows\syswow64\dgVoodoo.conf" >NUL 2>&1
del "C:\windows\system32\dgVoodoo.conf" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading %installname%  ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/%installname%.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\%installname%.7z %drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%.7z /E /H /C /I
) ELSE (
    ECHO %installname% file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
echo ************************************************
echo Note - nglide dlls are replaced by dgvoodoo. you need to install nglide again to use it. you should delete all nglide related dlls from the game folder for dgvoodoo effect.

timeout.exe /t 2 >nul
notepad.exe C:\windows\syswow64\dgvoodoo.conf
timeout.exe /t 3 >nul
pause
