@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** Enjoy flash or swf games ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading ResourceHacker ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\ResourceHacker.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/ResourceHacker.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\ResourceHacker.7z %drive_letter%:\Ajay_prefix\wget_files\Files\ResourceHacker.7z /E /H /C /I
) ELSE (
    ECHO ResourceHacker already exists.
)


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\ResourceHacker.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

echo *** opening ResourceHacker ***
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
Start %drive_letter%:\Ajay_prefix\wget_files\temp\ResourceHacker.exe
echo ************************************************
timeout.exe /t 3 >nul
