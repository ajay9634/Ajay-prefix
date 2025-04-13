@echo off
setlocal EnableDelayedExpansion
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
cls
echo Fetching available DXVK-Sarek versions...
:: Ensure temp folder exists before download
if not exist "D:/Ajay_prefix/wget_files/temp" mkdir "D:/Ajay_prefix/wget_files/temp"

:: Download the list of releases
wget -q -O D:/Ajay_prefix/wget_files/temp/all_releases.json https://api.github.com/repos/pythonlover02/DXVK-Sarek/releases

goto show_version_list

:version_input
set /p "version=Type the version [e.g., 1.10.8 or 1.10.8-async]: "
echo.
echo You entered version: %version%
echo.
color 0a
echo *** wait....***
echo .
echo *** script made by Ajay ***

:: Add 'v' only for the URL
set "version_tag=v%version%"

color 0A
echo.
echo *** Downloading dxvk-sarek-v%version%.tar.gz ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\dxvk-sarek-v%version%.tar.gz" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/pythonlover02/DXVK-Sarek/releases/download/%version_tag%/dxvk-sarek-v%version%.tar.gz
    
IF EXIST "D:\Ajay_prefix\wget_files\temp\dxvk-sarek-v%version%.tar.gz" (
    copy /y D:\Ajay_prefix\wget_files\temp\dxvk-sarek-v%version%.tar.gz D:\Ajay_prefix\wget_files\d3d\dxvk-sarek-v%version%.tar.gz
)
    
color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\dxvk-sarek-v%version%.tar.gz C:\windows\temp\ -r -y >NUL 2>&1

:: Dynamically find the extracted folder
set "dxvk_dir="
for /d %%F in (C:\windows\temp\dxvk-*) do (
    set "dxvk_dir=%%~nxF"
)

if not defined dxvk_dir (
    echo ERROR: Could not find extracted DXVK folder.
    goto end
)

echo *** Installing from !dxvk_dir! ***
if exist "C:\windows\temp\!dxvk_dir!\x64" ren "C:\windows\temp\!dxvk_dir!\x64" system32
if exist "C:\windows\temp\!dxvk_dir!\x32" ren "C:\windows\temp\!dxvk_dir!\x32" syswow64

Xcopy /s /y C:\windows\temp\!dxvk_dir!\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y C:\windows\temp\!dxvk_dir!\syswow64\ C:\windows\syswow64\ /E /H /C /I

echo ************************************************
timeout.exe 3 /nobreak
goto end

:show_version_list
echo.
setlocal EnableDelayedExpansion
set count=0
for /f "tokens=2 delims=:" %%A in ('findstr /i "tag_name" D:/Ajay_prefix/wget_files/temp/all_releases.json 2^>nul') do (
    set "ver=%%A"
    set "ver=!ver:,=!"
    set "ver=!ver:"=!"
    set "ver=!ver: =!"
    set "ver=!ver:v=!"
    set /a count+=1
    echo !count!. !ver!
)
endlocal
echo.
goto version_input

:end