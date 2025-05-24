@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
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
echo *** Downloading xliveredist_3.5.95.0 ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\xliveredist_3.5.95.0.msi" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/xliveredist_3.5.95.0.msi
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\xliveredist_3.5.95.0.msi %drive_letter%:\Ajay_prefix\wget_files\Files\xliveredist_3.5.95.0.msi /E /H /C /I
) ELSE (
    ECHO xliveredist_3.5.95.0 already exists.
)


color 1f
echo *** opening xliveredist_3.5.95.0 ***
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
Start "" %drive_letter%:\Ajay_prefix\wget_files\Files\xliveredist_3.5.95.0.msi
echo ************************************************
timeout.exe /t 3 >nul
