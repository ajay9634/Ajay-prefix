@echo off
:: Set installname as the name of the script file (without extension)
set "installname=%~n0"

:: Extract version (e.g., 9.4.0) from installname
for /f "tokens=3 delims=-" %%A in ("%installname%") do set "version=%%A"

:: Inform the user about the installation process
echo Installing %installname%
color 0a
echo *** Wait.... ***
echo *** Deleting temporary files... ***

:: Delete and recreate temporary folders
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp" >nul 2>&1
mkdir "D:/Ajay_prefix/wget_files/mono" >nul 2>&1

echo *** Deleted temporary files ***
echo.
echo *** Script made by Ajay ***
color 0A

:: Download the installer if it does not already exist
echo.
echo *** Downloading %installname% ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\mono\%installname%.msi" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://dl.winehq.org/wine/wine-mono/%version%/%installname%.msi
    copy /y D:\Ajay_prefix\wget_files\temp\%installname%.msi D:\Ajay_prefix\wget_files\mono\%installname%.msi >nul 2>&1
) ELSE (
    echo %installname% file already exists.
)

:: Install the MSI if it exists
color 1f
IF EXIST "D:\Ajay_prefix\wget_files\mono\%installname%.msi" (
    echo *** Installing wine mono 9.4.0 ... ***
    start /wait msiexec /i "D:\Ajay_prefix\wget_files\mono\%installname%.msi"
    cls
    echo Installation completed.
) ELSE (
    cls
    echo Check internet connection!
)

:: Final output
echo ***********************************************
pause
