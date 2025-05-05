@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
set "installname=Bruno's_d3d8_to_d3d9ex"
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"
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

:: Extract with 7-Zip
color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

:: Install if the extracted folders exist
echo *** Installing...***
if exist %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ (
    Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
    echo syswow64 installation complete!
) else (
    echo Warning: syswow64 folder not found. Skipping.
)

if exist %drive_letter%:\Ajay_prefix\wget_files\temp\system32\ (
    Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
    echo system32 installation complete!
) else (
    echo Warning: system32 folder not found. Skipping.
)

:: Open configuration
echo ************************************************
timeout.exe 3 /nobreak
