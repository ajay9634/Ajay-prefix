@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp"
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading dxcapsviewer.7z  ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\dxcapsviewer.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/dxcapsviewer.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\dxcapsviewer.7z %drive_letter%:\Ajay_prefix\wget_files\Files\dxcapsviewer.7z /E /H /C /I
) ELSE (
    ECHO dxcapsviewer file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\dxcapsviewer.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** opening ...***
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
Start %drive_letter%:\Ajay_prefix\wget_files\temp\dxcapsviewer.exe

echo ************************************************
timeout.exe /t 3 >nul
