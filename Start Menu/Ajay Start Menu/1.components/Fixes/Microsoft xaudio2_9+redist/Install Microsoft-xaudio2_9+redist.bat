@echo off
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading Microsoft-xaudio2_9+redist  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\Microsoft-xaudio2_9+redist.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Microsoft-xaudio2_9+redist.7z
    xcopy /s /y D:\Ajay_prefix\wget_files\temp\Microsoft-xaudio2_9+redist.7z D:\Ajay_prefix\wget_files\Files\ >NUL 2>&1
) ELSE (
    ECHO Microsoft-xaudio2_9+redist file already exists.
)

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\Microsoft-xaudio2_9+redist.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
if errorlevel 1 (
    echo Extraction failed. Exiting...
    exit /b
)
echo *** installing...***
xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I 
xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I 
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
