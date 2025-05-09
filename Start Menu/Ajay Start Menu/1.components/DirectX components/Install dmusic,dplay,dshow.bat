@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f
echo *** Note : This is a part of DirectX . dmusic ,dplay and dshow are included in this package. Install native registry after installing it. This may not work for all Emu ! ***
echo.
echo Do you want to install it? ?
echo [1] Yes
echo [2] No (Cancel)
echo.
set /p userChoice="Enter your choice (1 or 2): "

IF "%userChoice%"=="2" (
    echo *** Cancelled by user. Exiting script. ***
    pause
    exit /b
)

IF NOT "%userChoice%"=="1" (
    echo *** Invalid input. Please enter 1 or 2. Exiting script. ***
    pause
    exit /b
)
echo *** You selected Yes. Continuing... ***

echo *** wait ....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading dmusic,dplay,dshow ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\dmusic,dplay,dshow.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/dmusic,dplay,dshow.7z
    copy /s /y "%drive_letter%:\Ajay_prefix\wget_files\temp\dmusic,dplay,dshow.7z" "%drive_letter%:\Ajay_prefix\wget_files\Files\dmusic,dplay,dshow.7z"
) ELSE (
    ECHO File already exists.
)

color 1f
echo Installing...
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x "%drive_letter%:\Ajay_prefix\wget_files\Files\dmusic,dplay,dshow.7z" -oC:\windows\temp\ -r -y >NUL 2>&1
Xcopy /s /y C:\windows\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
echo.
timeout.exe 5 /nobreak >NUL 2>&1
cls
echo dmusic,dplay,dshow is installed !
echo removing temp files
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
echo removed temp files !
echo msgbox "Hello! dmusic,dplay,dshow are installed successfully. Now install dmusic,dplay,dshow registry as native,builtin !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
