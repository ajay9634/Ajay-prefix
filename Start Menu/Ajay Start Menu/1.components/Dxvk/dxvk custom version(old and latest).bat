@echo off
setlocal EnableDelayedExpansion
echo ( Recommended old dxvk version :- 0.40 , 0.54 , 0.96 , 1.5.5 , 1.7.1 , 1.7.3 , 1.10 , 1.10.3 , 2.0 , 2.1 , 2.3.1 , 2.4.1 ) 
goto show_version_list
:version_input
set /p "version=Type the version [eg 2.4.1]: "
if "%version%"=="" set "version=%latest_version%"

echo You entered version: %version%
echo.
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

color 0A
echo.
echo *** Downloading dxvk-%version%  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/doitsujin/dxvk/releases/download/v%version%/dxvk-%version%.tar.gz

    copy /y D:\Ajay_prefix\wget_files\temp\dxvk-%version%.tar.gz D:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz
) ELSE (
    ECHO dxvk-%version%.tar.gz file already exists.
)

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz C:\windows\temp\ -r -y >NUL 2>&1
echo *** installing...***
if exist "C:\windows\temp\dxvk-%version%\x64" ren "C:\windows\temp\dxvk-%version%\x64" system32
if exist "C:\windows\temp\dxvk-%version%\x32" ren "C:\windows\temp\dxvk-%version%\x32" syswow64
Xcopy /s /y C:\windows\temp\dxvk-%version%\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y C:\windows\temp\dxvk-%version%\syswow64\ C:\windows\syswow64\ /E /H /C /I

echo ************************************************
timeout.exe 5 /nobreak
goto end

:show_version_list
echo.
echo Fetching last 30 available DXVK versions...
echo.
setlocal EnableDelayedExpansion
set count=0
for /f "tokens=2 delims=:" %%A in ('findstr /i "tag_name" all_releases.json 2^>nul') do (
    set "ver=%%A"
    set "ver=!ver:,=!"
    set "ver=!ver:"=!"
    set "ver=!ver: =!"
    set "ver=!ver:v=!"
    set /a count+=1
    echo !count!. dxvk-!ver!
)
endlocal
echo.
goto version_input

:end
del all_releases.json >nul 2>&1
