@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** d3d wrapper by ThirteenAG ***
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo *** Script made by Ajay ***

:: Downloading d3d9_32bit_v1.60_wrapper_by_ThirteenAG if it doesn't exist
echo *** Checking for d3d9_32bit_v1.60_wrapper_by_ThirteenAG ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\d3d9_32bit_v1.60_wrapper_by_ThirteenAG.7z" (
    echo *** Downloading d3d9_32bit_v1.60_wrapper_by_ThirteenAG...***
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/d3d9_32bit_v1.60_wrapper_by_ThirteenAG.7z
    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\d3d9_32bit_v1.60_wrapper_by_ThirteenAG.7z %drive_letter%:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo file already exists.
)

:: Extracting NSIS
color 1f
echo *** Extracting d3d9_32bit_v1.60_wrapper_by_ThirteenAG ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\d3d9_32bit_v1.60_wrapper_by_ThirteenAG.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo Extraction failed. Please check the file and try again.
    pause
    exit /b
)

:: Launching the Installer
echo *** Opening d3d9_32bit_v1.60_wrapper_by_ThirteenAG  ***
echo msgbox "Hello! Extract it in game exe folder then you can edit ini !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
start /b cscript //nologo %tmp%\tmp.vbs
timeout.exe /t 1 >nul
del %tmp%\tmp.vbs
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
Start %drive_letter%:\Ajay_prefix\wget_files\temp\d3d9_32bit_v1.60_wrapper_by_ThirteenAG.exe
timeout.exe /t 3 >nul

echo ************************************************
