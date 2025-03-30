@echo off
color 0a
echo *** TitaniumGL_2025_02 ***
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo *** Script made by Ajay ***

:: Downloading d3d8_32bit_v1.38_wrapper_by_ThirteenAG if it doesn't exist
echo *** Checking for TitaniumGL_2025_02 ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\TitaniumGL_2025_02.7z" (
    echo *** Downloading TitaniumGL_2025_02...***
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/TitaniumGL_2025_02.7z
    copy /y D:\Ajay_prefix\wget_files\temp\TitaniumGL_2025_02.7z D:\Ajay_prefix\wget_files\d3d\
) ELSE (
    echo file already exists.
)

:: Extracting NSIS
color 1f
echo *** Extracting TitaniumGL_2025_02 ***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\d3d\TitaniumGL_2025_02.7z -oD:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo Extraction failed. Please check the file and try again.
    pause
    exit /b
)

:: Launching the Installer
echo *** Opening TitaniumGL_2025_02  ***
echo msgbox "Hello! Extract it in game exe folder !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
start /b cscript //nologo %tmp%\tmp.vbs
timeout.exe /t 1 >nul
del %tmp%\tmp.vbs
Start D:\Ajay_prefix\wget_files\temp\TitaniumGL_2025_02_opengl_to_software_wrapper.exe

echo ************************************************