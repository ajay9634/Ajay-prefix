@echo off
:: Paths
set "PREFIX_DIR=D:\Ajay_prefix"
set "TEMP_DIR=%PREFIX_DIR%\wget_files\temp"
set "DDIR=%PREFIX_DIR%\wget_files\d3d"
set "WRAPPER_DEST_DIR=C:\windows\syswow64"
set "WRAPPER_NAME=DxWrapper"

:: Clean up
echo *** deleting temp files... ***
rmdir /S /Q "%TEMP_DIR%" >NUL 2>&1
rmdir /S /Q "C:\windows\temp" >NUL 2>&1
mkdir "C:\windows\temp" >NUL 2>&1
mkdir "%TEMP_DIR%" >NUL 2>&1
echo *** deleted temp files ***
cls

:: Fetch latest releases
echo Fetching latest available DxWrapper versions...
wget -q -O "%TEMP_DIR%\all_releases.json" https://api.github.com/repos/elishacloud/dxwrapper/releases

goto show_version_list

:version_input
set /p "version=Type the version [e.g. 1.3.7700.25]: "
echo.
echo You entered version: %version%
echo.
color 0a
echo *** wait....***
echo.
echo *** script made by Ajay ***

color 0A
echo.
echo *** Downloading DxWrapper %version% ***
IF NOT EXIST "%DDIR%\DxWrapper-%version%.zip" (
    wget -q --show-progress -P "%TEMP_DIR%" --progress=dot:mega https://github.com/elishacloud/dxwrapper/releases/download/v%version%/DxWrapper.zip
    copy /y "%TEMP_DIR%\DxWrapper.zip" "%DDIR%\DxWrapper-%version%.zip"
) ELSE (
    echo DxWrapper-%version%.zip already exists.
)

:: Extract to temp
echo *** Extracting DxWrapper ***
set "WRAPPER_EXTRACT_DIR=C:\windows\temp\dxwrapper-%version%"
D:\Ajay_prefix\.Resources\winrar.exe x "%DDIR%\DxWrapper-%version%.zip" "%WRAPPER_EXTRACT_DIR%\" -r -y >NUL 2>&1

:: Copy default files
echo *** Copying default DxWrapper files ***

copy /Y "%WRAPPER_EXTRACT_DIR%\Stub\ddraw.dll" "%WRAPPER_DEST_DIR%\" >NUL
echo Copied: ddraw.dll
copy /Y "%WRAPPER_EXTRACT_DIR%\Stub\d3d8.dll" "%WRAPPER_DEST_DIR%\" >NUL
echo Copied: d3d8.dll
copy /Y "%WRAPPER_EXTRACT_DIR%\dxwrapper.dll" "%WRAPPER_DEST_DIR%\" >NUL
echo Copied: dxwrapper.dll
copy /Y "%WRAPPER_EXTRACT_DIR%\dxwrapper.ini" "%WRAPPER_DEST_DIR%\" >NUL
echo Copied: dxwrapper.ini
echo opening dxwrapper.ini
start "" notepad.exe "%WRAPPER_DEST_DIR%\dxwrapper.ini"
timeout /t 1 >nul
echo msgbox "Hello! Edit the dxwrapper.ini file, set Dd7to9=1 and Dd8to9=1, then save it to ensure it works properly!" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript //nologo %tmp%\tmp.vbs
timeout /t 1 >nul
del %tmp%\tmp.vbs


echo ************************************************
timeout.exe 3 /nobreak
goto end

:show_version_list
echo.
setlocal EnableDelayedExpansion
set count=0
set "min_version=1.3.7700.25"  :: Set the minimum version to display

for /f "tokens=2 delims=:" %%A in ('findstr /i "tag_name" %TEMP_DIR%\all_releases.json 2^>nul') do (
    set "ver=%%A"
    set "ver=!ver:,=!"
    set "ver=!ver:"=!"
    set "ver=!ver: =!"
    set "ver=!ver:v=!"

    :: Compare versions
    if !ver! GEQ %min_version% (
        set /a count+=1
        echo !count!. DxWrapper-!ver!
    )
)
endlocal
echo.
goto version_input

:end
