@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** gldirect-Opengl_to_dx9 ***
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo *** Script made by Ajay ***

echo Setting opengl32.dll to native,builtin...

:: Add the registry key
reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "opengl32" /t REG_SZ /d "native,builtin" /f >nul 2>&1

if %errorlevel%==0 (
    echo Successfully set opengl32.dll to native,builtin.
) else (
    echo Failed to set opengl32.dll. set it manually .
)

:: Downloading d3d8_32bit_v1.38_wrapper_by_ThirteenAG if it doesn't exist
echo *** Checking for gldirect-Opengl_to_dx9 ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\d3d\gldirect-Opengl_to_dx9.7z" (
    echo *** Downloading gldirect-Opengl_to_dx9...***
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/gldirect-Opengl_to_dx9.7z
    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\gldirect-Opengl_to_dx9.7z %drive_letter%:\Ajay_prefix\wget_files\d3d\
) ELSE (
    echo file already exists.
)

:: Extracting NSIS
color 1f
echo *** Extracting gldirect-Opengl_to_dx9 ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\d3d\gldirect-Opengl_to_dx9.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo Extraction failed. Please check the file and try again.
    pause
    exit /b
)

:: Launching the Installer
echo *** Opening gldirect-Opengl_to_dx9  ***
echo msgbox "Hello! Extract it in game exe folder !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
start /b cscript //nologo %tmp%\tmp.vbs
timeout.exe /t 1 >nul
del %tmp%\tmp.vbs
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
Start %drive_letter%:\Ajay_prefix\wget_files\temp\gldirect-Opengl_to_dx9.exe
timeout.exe /t 3 >nul

echo ************************************************
