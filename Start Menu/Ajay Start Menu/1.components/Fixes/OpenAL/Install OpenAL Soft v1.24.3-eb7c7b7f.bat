@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading OpenALSoft v1.24.3-eb7c7b7f ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\dsound\OpenALSoft.zip" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/kcat/openal-soft/releases/download/latest/OpenALSoft.zip
) ELSE (
    ECHO file already exists.
)

color 1f
echo *** Extracting ...***

:: Extract outer OpenALSoft.zip
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x %drive_letter%:\Ajay_prefix\wget_files\temp\OpenALSoft.zip %drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

echo *** installing...***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Win64\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Win32\ C:\windows\syswow64\ /E /H /C /I
echo adding openal32 as native,builtin 
reg add "HKCU\Software\Wine\DllOverrides" /v openal32 /t REG_SZ /d native,builtin /f >nul
echo ************************************************
timeout.exe 5 /nobreak
pause
exit