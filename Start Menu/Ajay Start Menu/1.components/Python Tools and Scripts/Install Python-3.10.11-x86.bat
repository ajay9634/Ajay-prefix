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
ECHO 3. Install aj prefix extension registry (ajpy , ajpyw etc)
ECHO 4. Cancel or exit
echo.
set choice=
set /p choice=Type the number to select an option -
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install
if '%choice%'=='2' goto dependencies
if '%choice%'=='3' goto Register
if '%choice%'=='4' goto cancel
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
@echo off
:Register
echo [STEP] Registering aj-prefixed file extensions...

:: Register .ajpy
reg add "HKCR\.ajpy" /ve /d "ajpyfile" /f >nul
reg add "HKCR\ajpyfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpyw
reg add "HKCR\.ajpyw" /ve /d "ajpywfile" /f >nul
reg add "HKCR\ajpywfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\pythonw.exe\" \"%%1\"" /f >nul

:: Register .ajpyo
reg add "HKCR\.ajpyo" /ve /d "ajpyofile" /f >nul
reg add "HKCR\ajpyofile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpyc
reg add "HKCR\.ajpyc" /ve /d "ajpycfile" /f >nul
reg add "HKCR\ajpycfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpyd
reg add "HKCR\.ajpyd" /ve /d "ajpydfile" /f >nul
reg add "HKCR\ajpydfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpyz
reg add "HKCR\.ajpyz" /ve /d "ajpyzfile" /f >nul
reg add "HKCR\ajpyzfile\shell\open\command" /ve /d "\"%Ajay_File_Manager%\pythonw.exe\" \"%%1\"" /f >nul

:: Register .ajpyx
reg add "HKCR\.ajpyx" /ve /d "ajpyxfile" /f >nul
reg add "HKCR\ajpyxfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpxi
reg add "HKCR\.ajpxi" /ve /d "ajpxifile" /f >nul
reg add "HKCR\ajpxifile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpxd
reg add "HKCR\.ajpxd" /ve /d "ajpxdfile" /f >nul
reg add "HKCR\ajpxdfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul
timeout /t 6 >nul
reg add "HKCR\.ajpy" /ve /d "ajpyfile" /f >nul
reg add "HKCR\ajpyfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpyw
reg add "HKCR\.ajpyw" /ve /d "ajpywfile" /f >nul
reg add "HKCR\ajpywfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\pythonw.exe\" \"%%1\"" /f >nul

:: Register .ajpyo
reg add "HKCR\.ajpyo" /ve /d "ajpyofile" /f >nul
reg add "HKCR\ajpyofile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpyc
reg add "HKCR\.ajpyc" /ve /d "ajpycfile" /f >nul
reg add "HKCR\ajpycfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpyd
reg add "HKCR\.ajpyd" /ve /d "ajpydfile" /f >nul
reg add "HKCR\ajpydfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpyz
reg add "HKCR\.ajpyz" /ve /d "ajpyzfile" /f >nul
reg add "HKCR\ajpyzfile\shell\open\command" /ve /d "\"%Ajay_File_Manager%\pythonw.exe\" \"%%1\"" /f >nul

:: Register .ajpyx
reg add "HKCR\.ajpyx" /ve /d "ajpyxfile" /f >nul
reg add "HKCR\ajpyxfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpxi
reg add "HKCR\.ajpxi" /ve /d "ajpxifile" /f >nul
reg add "HKCR\ajpxifile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul

:: Register .ajpxd
reg add "HKCR\.ajpxd" /ve /d "ajpxdfile" /f >nul
reg add "HKCR\ajpxdfile\shell\open\command" /ve /d "\"C:\Program Files (x86)\Python310-32\python.exe\" \"%%1\"" /f >nul
timeout /t 3 >nul
echo [ OK  ] All .aj* file types registered with Python
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
