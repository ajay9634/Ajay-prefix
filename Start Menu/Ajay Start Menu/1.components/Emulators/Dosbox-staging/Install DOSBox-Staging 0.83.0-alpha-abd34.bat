@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** Enjoy Dosbox games ***
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
echo *** Downloading dosbox-staging-windows-x64-0.83.0-alpha-abd34 ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\dosbox-staging-windows-x64-0.83.0-alpha-abd34.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/dosbox-staging-windows-x64-0.83.0-alpha-abd34.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\dosbox-staging-windows-x64-0.83.0-alpha-abd34.7z %drive_letter%:\Ajay_prefix\wget_files\Files\dosbox-staging-windows-x64-0.83.0-alpha-abd34.7z /E /H /C /I
) ELSE (
    ECHO dosbox-staging-windows-x64-0.83.0-alpha-abd34 already exists.
)


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\dosbox-staging-windows-x64-0.83.0-alpha-abd34.7z -o%drive_letter%:\Ajay_prefix\wget_files\my_apps\ -p-q -r -y >NUL 2>&1

echo *** downloading latest dosbox script...***
wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/dosbox_script.7z
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\temp\dosbox_script.7z -o%drive_letter%:\Ajay_prefix\wget_files\my_apps\dosbox-staging-windows-x64-0.83.0-alpha-abd34\ -r -y >NUL 2>&1

echo *** opening dosbox staging ***
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
Start %drive_letter%:\Ajay_prefix\wget_files\my_apps\dosbox-staging-windows-x64-0.83.0-alpha-abd34\dosbox.exe
echo ************************************************
timeout.exe /t 3 >nul

pause