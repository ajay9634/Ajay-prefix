@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** Enjoy scummvm supported games ***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading scummvm ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\scummvm.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/scummvm.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\scummvm.7z %drive_letter%:\Ajay_prefix\wget_files\Files\scummvm.7z /E /H /C /I
) ELSE (
    ECHO scummvm already exists.
)


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\scummvm.7z -o%drive_letter%:\Ajay_prefix\wget_files\my_apps\ -p-q -r -y >NUL 2>&1

echo *** opening scummvm ***
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
Start %drive_letter%:\Ajay_prefix\wget_files\my_apps\scummvm\scummvm\scummvm.exe
echo ************************************************
timeout.exe /t 3 >nul

pause