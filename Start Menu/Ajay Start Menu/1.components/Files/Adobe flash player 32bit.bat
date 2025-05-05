@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** Enjoy flash or swf games ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading flashplayer_32_sa ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\flashplayer_32_sa.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/flashplayer_32_sa.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\flashplayer_32_sa.7z %drive_letter%:\Ajay_prefix\wget_files\Files\flashplayer_32_sa.7z /E /H /C /I
) ELSE (
    ECHO flashplayer_32_sa already exists.
)


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\flashplayer_32_sa.7z -o%drive_letter%:\Ajay_prefix\wget_files\my_apps\ -r -y >NUL 2>&1

echo *** opening flashplayer_32_sa ***
Start "" "%drive_letter%:\Ajay_prefix\wget_files\my_apps\flashplayer_32_sa.exe"
echo ************************************************
timeout.exe /t 3 >nul
