@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading img2iso converter ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\img2iso.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/img2iso.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\img2iso.7z %drive_letter%:\Ajay_prefix\wget_files\Files\img2iso.7z /E /H /C /I
) ELSE (
    ECHO img2iso file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\img2iso.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo *** Running ...***
echo msgbox "Hello! Winrar Extract location should be the game folder, img files should be present in the game folder !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
Start /wait %drive_letter%:\Ajay_prefix\wget_files\temp\img2iso.exe
echo ************************************************
timeout.exe 3 /nobreak
