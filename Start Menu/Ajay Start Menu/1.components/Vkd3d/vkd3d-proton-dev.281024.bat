@echo off
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading vkd3d-proton-dev.281024  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\vkd3d-proton-dev.281024.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/vkd3d-proton-dev.281024.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\vkd3d-proton-dev.281024.7z D:\Ajay_prefix\wget_files\d3d\vkd3d-proton-dev.281024.7z /E /H /C /I
) ELSE (
    ECHO vkd3d-proton-dev.281024.7z file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\d3d\vkd3d-proton-dev.281024.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I

echo ************************************************
timeout.exe 5 /nobreak
