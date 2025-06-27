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
echo *** Downloading DSOAL master ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\dsound\DSOAL.zip" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/kcat/DSOAL/releases/download/latest-master/DSOAL.zip
) ELSE (
    ECHO file already exists.
)

color 1f
echo *** Extracting ...***

:: Extract outer DSOAL.zip
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x %drive_letter%:\Ajay_prefix\wget_files\temp\DSOAL.zip %drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

:: Find and extract inner ZIP (whatever its name is)
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x %drive_letter%:\Ajay_prefix\wget_files\temp\DSOAL_*.zip %drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

IF ERRORLEVEL 1 (
    echo.
    echo [WARN] WinRAR extraction failed. Trying with 7-Zip...
    C:\Windows\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\temp\DSOAL.zip -o%drive_letter%:\Ajay_prefix\wget_files\temp -y
C:\Windows\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\temp\DSOAL_*.zip -o%drive_letter%:\Ajay_prefix\wget_files\temp -y
    IF ERRORLEVEL 1 (
        echo.
        echo [ERROR] Both WinRAR and 7-Zip failed to extract the archive.
        echo Make sure all parts exist and are not corrupted.
        timeout /t 5 >nul
        exit /b 1
    )
)

echo *** Now choose an option - ***
echo.
ECHO 1. Install DSOAL 
ECHO 2. Install DSOAL+HRTF 
ECHO 3. Cancel or exit
set choice=
set /p choice=Type the number to select an option-
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install1
if '%choice%'=='2' goto install2
if '%choice%'=='3' goto cancel
ECHO "%choice%" is not valid, try again
ECHO.
goto choice

:cancel
echo.
ECHO Installation cancelled. 
exit
:install1
echo *** installing...***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\DSOAL\Win64\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\DSOAL\Win32\ C:\windows\syswow64\ /E /H /C /I

echo ************************************************
timeout.exe 5 /nobreak
pause
exit

:install2

echo *** installing...***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\DSOAL+HRTF\Win64\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\DSOAL+HRTF\Win32\ C:\windows\syswow64\ /E /H /C /I
echo ************************************************
timeout.exe 5 /nobreak
