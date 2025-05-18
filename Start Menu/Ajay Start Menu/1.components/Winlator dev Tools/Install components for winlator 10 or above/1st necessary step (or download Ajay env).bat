@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1F
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
cls
echo "Hello! This is a necessary step before downloading Winlator stuff for winlator 10 or above. You have two options to proceed -"
echo.
echo 1 - Rename the drive E path manually and remove 'storage' from the end. (exit)
echo 2 - Download and Replace the .container file with Ajay env ! (continue this script)
echo.
set /p choice="Press 2 to continue or 1 to exit: "

if /i "%choice%"=="1" (
    echo Operation canceled.
    exit /b
)

if /i not "%choice%"=="2" (
    echo Invalid choice. Exiting...
    exit /b
)
title 1st Step
cls
echo ----------------------------------------------------------------------------

echo 1st Step before installing winlator stuff

echo ----------------------------------------------------------------------------
echo Are you sure you want to copy and replace ".container" to "Z:\home\xuser\"?  
echo This may corrupt container settings in Winlator 10 official or above !
echo You need to modify container settings after exiting this container. 
echo New updated container will be named as "Container-Ajay" then rename it as you like !
echo You can install different box64, Turnip, dxvk and other additional stuff after installing this.
echo.
echo Still want to continue? (Y/N)
echo.
set /p choice="Press Y to continue or N to exit: "

if /i "%choice%"=="N" (
    echo Operation canceled.
    exit /b
)

if /i not "%choice%"=="Y" (
    echo Invalid choice. Exiting...
    exit /b
)

if not exist "C:\windows\temp" mkdir "C:\windows\temp"

@echo off
@echo off
setlocal

:: Define paths
set "origfile=Z:\home\xuser\.container"
set "tempfolder=%TEMP%\container_edit"
set "tempfile=%tempfolder%\.container"

:: Create temp folder
if not exist "%tempfolder%" mkdir "%tempfolder%"

:: Copy original file to temp
copy /y "%origfile%" "%tempfile%"

:: Define replacements
set "old=E:\/data\/data\/com.winlator\/storage"
set "new=E:\/data\/data\/com.winlator"
set "inject=MESA_VK_WSI_DEBUG=(sw BOX64_DYNAREC_PAUSE=0 BOX64_NOBANNER=1 BOX64_DYNAREC_DIRTY=1 BOX64_UNITYPLAYER=1 vblank_mode=0 ZINK_DESCRIPTOR_POOL=1 ZINK_USE_LOW_MEMORY_POOL=1 BOX64_MMAP32=1 "

:: Read whole file
set /p content=<"%tempfile%"

:: Do replacements
call set "content=%%content:%old%=%new%%%"

call set "content=%%content:envVars":"=envVars":"%inject%%%"

call set "content=%%content:Container=Container-Ajay%%%"

call set "content=%%content:}=}}%%%"

:: Write back to temp file
echo %content%>"%tempfile%"

:: Copy modified file back to original location
copy /y "%tempfile%" "%origfile%"

:: Cleanup
rd /s /q "%tempfolder%"
cls
echo Done.
echo Enjoy good performance.
echo Exiting Current Container...
timeout.exe 5 /nobreak >NUL 2>&1
taskkill /F /IM Start.exe
exit /b
