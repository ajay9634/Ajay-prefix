@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** Easily extract and edit .zst, .zip, .7z, and other archive formats with 7z24.09-zstd-x64 ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading 7z24.09-zstd-x64 ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\7z24.09-zstd-x64.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Archive-Tools/7z24.09-zstd-x64.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\7z24.09-zstd-x64.7z %drive_letter%:\Ajay_prefix\wget_files\Files\7z24.09-zstd-x64.7z /E /H /C /I
) ELSE (
    ECHO File already exists.
)


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\7z24.09-zstd-x64.7z -o"C:\Program Files\" -p-q -r -y >NUL 2>&1

echo *** Opening 7z24.09-zstd-x64  ***
Start "7zFM" "C:\Program Files\7z24.09-zstd-x64\7zFM.exe"
echo ************************************************
timeout.exe /t 3 >nul
