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
echo *** Downloading Microsoft-xaudio2_9+redist  ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Microsoft-xaudio2_9+redist.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Microsoft-xaudio2_9+redist.7z
    xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Microsoft-xaudio2_9+redist.7z %drive_letter%:\Ajay_prefix\wget_files\Files\ >NUL 2>&1
) ELSE (
    ECHO Microsoft-xaudio2_9+redist file already exists.
)

color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\Microsoft-xaudio2_9+redist.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
if errorlevel 1 (
    echo Extraction failed. Exiting...
    exit /b
)
echo *** installing...***
xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I 
xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I 
if errorlevel 1 (
    echo Installation failed. Check paths and permissions.
    exit /b
)

echo.
echo Now install xaudio2_9+redist-native(enable).cmd
echo.

echo ************************************************

timeout.exe 5 /nobreak >NUL 2>&1
pause
