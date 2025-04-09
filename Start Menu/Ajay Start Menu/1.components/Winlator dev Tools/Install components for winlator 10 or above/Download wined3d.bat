@echo off
setlocal enabledelayedexpansion

:: Check for required folders in Drive E
if not exist "E:\Storage\" (
    echo Error: Storage folder not found in Drive E. You should follow 1st necessary step.
    echo exiting..
    timeout.exe 5 /nobreak
    exit /b
)
if not exist "E:\files\" (
    echo Error: files folder not found in Drive E. You should follow 1st necessary step.
    echo exiting..
    timeout.exe 5 /nobreak
    exit /b
)
if not exist "E:\shared_prefs\" (
    echo Error: shared_prefs folder not found in Drive E. You should follow 1st necessary step.
    echo exiting..
    timeout.exe 5 /nobreak
    exit /b
)

echo All required folders found. Proceeding...

:: Create installed_components/wined3d inside files if it doesn't exist
if not exist "E:\files\installed_components\wined3d" (
    mkdir "E:\files\installed_components\wined3d"
    echo Folder 'installed_components/wined3d' created successfully.
) else (
    echo Folder 'installed_components/wined3d' already exists.
)

:: Check if wget is installed
where wget >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: wget is not installed or not in PATH.
    echo Download wget from https://eternallybored.org/misc/wget/
    exit /b
)

:: Set GitHub API URL
:choice
echo .
echo Select GitHub to download wined3d -
echo [1] Ajay9634
echo [2] brunodev85
echo [3] Cancel
echo .
set /p userChoice=Enter your choice (1 or 2 or 3): 

IF "%userChoice%"=="1" (
    echo *** You selected Ajay9634 GitHub ***
    set "apiURL=https://api.github.com/repos/ajay9634/Ajay-prefix/contents/installable_components/wined3d?ref=Winlator-10-stuff"
goto download
    exit /b
)

IF "%userChoice%"=="2" (
    echo *** You selected brunodev85 GitHub ***
    set "apiURL=https://api.github.com/repos/brunodev85/winlator/contents/installable_components/wined3d?ref=main"
goto download
    exit /b
)

IF "%userChoice%"=="3" (
    echo *** cancelled ***
    exit /b
)

echo "wrong input , Please try again "
goto choice

:download
:: Fetch folder contents using wget
echo Fetching folder contents...
wget -q --output-document=temp.json --header="Accept: application/vnd.github.v3+json" "!apiURL!"

:: Check if temp.json exists
if not exist temp.json (
    echo Error: Failed to fetch folder data from GitHub.
    exit /b
)

:: Extract and display filenames
echo Files Available for Download:
set /a index=1
for /f "tokens=2 delims=:," %%a in ('findstr /C:"\"name\":" temp.json') do (
    set "filename=%%~a"
    set "filename=!filename:~2,-1!"
    echo !index!. !filename!
    set "file[!index!]=!filename!"
    set /a index+=1
)

:: Choose a file to download
echo.
set /p choice=Enter the file number to download (or 0 to Back): 
if "!choice!"=="0" (
    del temp.json
    cls
    goto choice
)

:: Validate choice
if not defined file[%choice%] (
    echo Invalid choice. Please try again.
    del temp.json
    cls
    goto choice
)

set "selectedFile=!file[%choice%]!"
echo Selected File: !selectedFile!

:: Generate GitHub Raw URL
set "fileURL=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Winlator-10-stuff/installable_components/wined3d/!selectedFile!"

:: Check if the file already exists, delete if present
if exist "E:\files\installed_components\wined3d\!selectedFile!" (
    echo File already exists. Deleting...
    del /f /q "E:\files\installed_components\wined3d\!selectedFile!"
    if exist "E:\files\installed_components\wined3d\!selectedFile!" (
        echo Error: Failed to delete existing file. Check permissions.
        exit /b
    )
)

:: Download the file using wget with retry and resume
echo Downloading !selectedFile! to E:\files\installed_components\wined3d...
wget --retry-connrefused --waitretry=3 --timeout=30 --tries=5 -O "E:\files\installed_components\wined3d\!selectedFile!" "!fileURL!"

:: Check if download succeeded
if exist "E:\files\installed_components\wined3d\!selectedFile!" (
    echo Download successful: E:\files\installed_components\wined3d\!selectedFile!
) else (
    echo Download failed. Please check your internet connection or file URL.
)

:: Cleanup
del temp.json
goto choice
pause
