@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
set "installname=mf"
color 0a
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading %installname%  ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Fixes\%installname%.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/%installname%.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\%installname%.7z %drive_letter%:\Ajay_prefix\wget_files\Fixes\%installname%.7z /E /H /C /I
) ELSE (
    ECHO %installname% file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Fixes\%installname%.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
echo applying native,builtin registry
reg add "HKCU\Software\Wine\DllOverrides" /v mf    /d "native,builtin" /f >nul
timeout.exe 5 /nobreak >NUL 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v mf    /d "native,builtin" /f >nul
echo done !
echo ************************************************
timeout.exe 3 /nobreak
