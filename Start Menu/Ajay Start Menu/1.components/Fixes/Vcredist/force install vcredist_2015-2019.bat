@echo off
color 84
echo Uninstalling VC Redist 2015-2022...

:: Remove temporary folder if it exists
rmdir /S /Q C:\temp\

:: Extract required files from the archive
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\.Resources\Resources.7z -oC:\temp *vcredist_2022_x86.exe *vcredist_2022_x64.exe -p-q -r -y >NUL 2>&1

:: Check if the extraction succeeded
if not exist "C:\temp\Resources\files\vcredist_2022_x86.exe" (
    echo Failed to extract vcredist_2022_x86.exe. Exiting...
    echo msgbox "Hello! Ajay Prefix offline files aren't available in drive D, you should get it from Ajay9634 github" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
start iexplore.exe https://github.com/ajay9634/Ajay-prefix/releases/tag/Ajay_prefix
    exit /b
)

if not exist "C:\temp\Resources\files\vcredist_2022_x64.exe" (
    echo Failed to extract vcredist_2022_x64.exe. Exiting...
    echo msgbox "Hello! Ajay Prefix offline files aren't available in drive D, you should get it from Ajay9634 github" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
start iexplore.exe https://github.com/ajay9634/Ajay-prefix/releases/tag/Ajay_prefix
    exit /b
)

:: Uninstall x86 version
start /wait C:\temp\Resources\files\vcredist_2022_x86.exe /uninstall /quiet /norestart

:: Uninstall x64 version
start /wait C:\temp\Resources\files\vcredist_2022_x64.exe /uninstall /quiet /norestart

:: Clean up temporary folder
rmdir /S /Q C:\temp\

echo Uninstalled VC Redist 2015-2022

color 0A
echo.
echo *** Downloading vc_redist_2015-2019 ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\vc_redist_2019.7z" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/vc_redist_2019.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\vc_redist_2019.7z D:\Ajay_prefix\wget_files\Files\vc_redist_2019.7z /E /H /C /I
) ELSE (
    ECHO vc_redist_2015-2019 already exists.
)


color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\vc_redist_2019.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

echo *** installing vcredist_2015-2019 ***
Start /wait D:\Ajay_prefix\wget_files\temp\vc_redist_2019.x86.exe /repair /passive /norestart
Start /wait D:\Ajay_prefix\wget_files\temp\vc_redist_2019.x64.exe /repair /passive /norestart

echo ************************************************
