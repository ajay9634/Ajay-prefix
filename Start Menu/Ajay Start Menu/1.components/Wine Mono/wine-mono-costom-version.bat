@echo off
echo.

:version_input
:: Allow the user to type or confirm the version before proceeding
set /p "typed_version=Type the version [eg 9.4.0]: "
if not defined typed_version (
    set "typed_version=%version%"
)
echo You entered version: %typed_version%
echo.


:: Deleting temporary files
echo *** Deleting temporary files... ***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >nul 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >nul 2>&1
mkdir "D:/Ajay_prefix/wget_files/mono" >nul 2>&1

echo *** Deleted temporary files ***
echo.
echo *** Script made by Ajay ***
color 0A

:: Download the installer if it does not already exist
IF NOT EXIST "D:/Ajay_prefix/wget_files/mono/wine-mono-%typed_version%-x86.msi" (
echo.
echo *** Downloading mono %typed_version% ***
wget -P "D:/Ajay_prefix/wget_files/temp/" --progress=dot:mega "https://dl.winehq.org/wine/wine-mono/%typed_version%/wine-mono-%typed_version%-x86.msi" >nul 2>&1

) else ( 
echo file exists
goto exist )

:: Check if the file was downloaded successfully
IF EXIST "D:/Ajay_prefix/wget_files/temp/wine-mono-%typed_version%-x86.msi" (
    echo *** Download successful! ***
    copy /y "D:/Ajay_prefix/wget_files/temp/wine-mono-%typed_version%-x86.msi" "D:/Ajay_prefix/wget_files/mono/wine-mono-%typed_version%-x86.msi" >nul 2>&1
) ELSE (
    echo Error: Version %typed_version% not found or download failed.
    echo Please check the version and internet connection then try again.
    goto version_input
)

:: Install the MSI if it exists
:exist
color 1f
IF EXIST "D:/Ajay_prefix/wget_files/mono/wine-mono-%typed_version%-x86.msi" (
    echo *** Installing... ***
    start /wait msiexec /i "D:/Ajay_prefix/wget_files/mono/wine-mono-%typed_version%-x86.msi" /quiet
    cls
    echo Installation completed successfully.
) ELSE (
    cls
    echo Installation failed: MSI file not found!
    pause
    exit /b
)

:: Final output
echo ***********************************************
pause