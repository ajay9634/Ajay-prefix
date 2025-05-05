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
echo *** Downloading vkd3d-w7  ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\d3d\vkd3d-w7.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/vkd3d-w7.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\vkd3d-w7.7z %drive_letter%:\Ajay_prefix\wget_files\d3d\vkd3d-w7.7z /E /H /C /I
) ELSE (
    ECHO vkd3d-w7 file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\d3d\vkd3d-w7.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I

echo ************************************************
timeout.exe 5 /nobreak
