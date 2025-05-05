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
echo *** Downloading dsound ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\dsound\dsound.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/dsound.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\dsound.7z %drive_letter%:\Ajay_prefix\wget_files\dsound\dsound.7z /E /H /C /I
) ELSE (
    ECHO dsound file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\dsound\dsound.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\WineSound5(515k)32bit\ C:\windows\ /E /H /C /I

echo ************************************************
timeout.exe 5 /nobreak
