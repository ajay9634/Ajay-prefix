@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

color 0a
color 1f
echo ==============================================================================================
echo Note - This version can run ajpy and ajpyw format and it won't conflict with other Python.
echo ==============================================================================================
:choice
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. Install Python-3.10.11-x86 to Program Files (x86)
ECHO 2. Install dependencies
ECHO 2. Cancel or exit
echo.
set choice=
set /p choice=Type the number to select an option -
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install
if '%choice%'=='2' goto dependencies
if '%choice%'=='3' goto cancel
ECHO "%choice%" is not valid, try again
ECHO.
goto choice

:cancel
echo.
ECHO Installation cancelled. 
exit

:install
echo.
echo *** Deleting temp files... ***
rmdir /S /Q "%drive_letter%:\Ajay_prefix\wget_files\temp"
mkdir "%drive_letter%:\Ajay_prefix\wget_files\temp"
echo *** Deleted temp files ***
echo.
echo *** Script made by Ajay ***
color 0A

echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Python310-32.part1.rar" (
    wget -q --show-progress -P "%drive_letter%:\Ajay_prefix\wget_files\temp" --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Python310-32.part1.rar
    copy /y "%drive_letter%:\Ajay_prefix\wget_files\temp\Python310-32.part1.rar" "%drive_letter%:\Ajay_prefix\wget_files\Files\Python310-32.part1.rar"
) ELSE (
    echo Part 01 already exists.
)

echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Python310-32.part2.rar" (
    wget -q --show-progress -P "%drive_letter%:\Ajay_prefix\wget_files\temp" --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Python310-32.part2.rar
    copy /y "%drive_letter%:\Ajay_prefix\wget_files\temp\Python310-32.part2.rar" "%drive_letter%:\Ajay_prefix\wget_files\Files\Python310-32.part2.rar"
) ELSE (
    echo Part 02 already exists.
)

call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

color 1f
echo.
echo Extracting...
"%drive_letter%:\Ajay_prefix\.Resources\winrar.exe" x -y "%drive_letter%:\Ajay_prefix\wget_files\Files\Python310-32.part1.rar" "C:\Program Files (x86)\"

IF ERRORLEVEL 1 (
    echo.
    echo [WARN] WinRAR extraction failed. Trying with 7-Zip...
    C:\Windows\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\Python310-32.part1.rar -o"C:\Program Files (x86)" -y
    IF ERRORLEVEL 1 (
        echo.
        echo [ERROR] Both WinRAR and 7-Zip failed to extract the archive.
        echo Make sure all parts exist and are not corrupted.
        timeout /t 5 >nul
        exit /b 1
    )
)

echo.
echo [STEP] Registering aj-prefixed file extensions...
set "PYTHON_DIR=C:\Program Files (x86)\Python310-32"
set "PYTHON_EXE=%PYTHON_DIR%\python.exe"
:: Function to add registry entries
setlocal ENABLEEXTENSIONS
for %%F in (py pyw pyo pyc pyd pyz pyx pxi pxd) do (
    set "EXT=%%F"
    set "KEY=aj%%Ffile"
    set "EXE=%PYTHON_EXE%"
    if /i "%%F"=="pyw" set "EXE=%PYTHON_DIR%\pythonw.exe"
    if /i "%%F"=="pyz" set "EXE=%Ajay_File_Manager%\pythonw.exe"

    reg add "HKCR\.aj!EXT!" /ve /d "!KEY!" /f >nul
    reg add "HKCR\!KEY!\shell\open\command" /ve /d "\"!EXE!\" \"%%1\"" /f >nul
)

echo [ OK  ] All .aj* file types registered with Python
echo.

echo.
echo *** Running the installer ***
start "" "C:\Program Files (x86)\Python310-32\python.exe"

timeout /t 3 >nul

exit

:dependencies
cls
color 0A

set "PYTHON_DIR=C:\Program Files (x86)\Python310-32"
set "PYTHON_EXE=%PYTHON_DIR%\python.exe"
set "PIP_EXE=%PYTHON_DIR%\Scripts\pip.exe"

echo =========================================================
echo        PYTHON DEPENDENCIES INSTALLER
echo =========================================================
echo.

:: [STEP] Check Python
if not exist "%PYTHON_EXE%" (
    echo [ERROR] Python not found:
    echo         %PYTHON_EXE%
    pause
    exit /b
)

:: [STEP] Ensure pip + setup tools
echo [STEP] Ensuring pip and tools...
"%PYTHON_EXE%" -m ensurepip >nul 2>&1
"%PYTHON_EXE%" -m pip install --upgrade pip setuptools wheel >nul 2>&1
echo [ OK  ] pip, setuptools, wheel installed
echo.

:: [STEP] Install required + optional packages silently
echo [STEP] Installing dependencies...
"%PIP_EXE%" install Pillow requests pyinstaller pystray >nul 2>&1
echo [ OK  ] Pillow, requests, pyinstaller, pystray installed
timeout /t 5 >nul
pause
