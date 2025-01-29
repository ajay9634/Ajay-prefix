@echo off
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading vkd3d-2.14.1  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\vkd3d-proton-2.14.1.tar.zst" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/HansKristian-Work/vkd3d-proton/releases/download/v2.14.1/vkd3d-proton-2.14.1.tar.zst
    copy /s /y D:\Ajay_prefix\wget_files\temp\vkd3d-proton-2.14.1.tar.zst D:\Ajay_prefix\wget_files\d3d\vkd3d-proton-2.14.1.tar.zst /E /H /C /I
) ELSE (
    ECHO vkd3d-2.14.1 file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***

D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\vkd3d-proton-2.14.1.tar.zst C:\windows\temp\ -r -y >NUL 2>&1
echo *** installing...***
ren C:\windows\temp\vkd3d-proton-2.14.1\x64 system32
ren C:\windows\temp\vkd3d-proton-2.14.1\x86 syswow64
Xcopy /s /y C:\windows\temp\vkd3d-proton-2.14.1\ C:\windows\ /E /H /C /I

echo ************************************************
