@echo off
color 1f
echo ==================================
echo ***** Note: Different java version for different games. This is jre 8u311 64 bit version.
echo Installation will take a while. *****
echo ==================================
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. Install jre-8u311 64bit
ECHO 2. Cancel or exit
set choice=
set /p choice=Type the number to select an option.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install
if '%choice%'=='2' goto cancel
ECHO "%choice%" is not valid, try again
ECHO.
goto end

:cancel
echo.
ECHO Installation cancelled. 
exit

:install
echo.
ECHO *** Installing jre 8u311 64bit ...***
echo.
echo *** Script made by Ajay ***
echo.
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"

:: Check if the .din backup file exists
IF EXIST "D:/Ajay_prefix/wget_files/Files/jre-8u311-64.din" (
    ECHO *** backup file found, Now running the installer...***
    copy "D:/Ajay_prefix/wget_files/Files/jre-8u311-64.din" "D:/Ajay_prefix/wget_files/temp/jre-8u311-64.exe"
) ELSE (
    echo.
    ECHO ! backup file not found, downloading...
    echo.
    wget -O "D:/Ajay_prefix/wget_files/temp/jre-8u311-64.exe" --progress=dot:mega https://www.filehorse.com/download/file/7ZJEfU2-q_nJry73x3MJbUHXQqrN0FDDlumVokaQA0w128gjAa1k-bN3oQJDc4OlxFMpjYniKZxjjT0XNGiAz47JW209dvfOqijzuwRmpyU/
    copy "D:/Ajay_prefix/wget_files/temp/jre-8u311-64.exe" "D:/Ajay_prefix/wget_files/Files/jre-8u311-64.din"
    echo.
    ECHO *** Download complete, installing...**"
    echo.
)

:: Run the installer
Start /wait D:/Ajay_prefix/wget_files/temp/jre-8u311-64.exe /s


ECHO *******
exit