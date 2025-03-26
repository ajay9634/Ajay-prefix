@echo off
set "installname=dxvk-gplasync-v2.6-1"
:: Extract the part after "dxvk-" to get the version
set "version=%installname:dxvk-=%"
echo Version: %version%
color 0a
echo *** Wait... ***
echo *** Deleting temp files... ***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** Deleted temp files ***
echo .
echo *** Script made by Ajay ***

:: Download section
color 0A
echo.
echo *** Downloading %installname% ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\%installname%.zip" (
    curl -L -O -J --output-dir "C:/windows/temp" "https://gitlab.com/Ph42oN/dxvk-gplasync/-/jobs/9421613685/artifacts/download?file_type=archive"
    timeout.exe 2 /nobreak >NUL 2>&1
    copy /y "C:/Windows/temp/%installname%.zip" "D:\Ajay_prefix\wget_files\d3d\%installname%.zip" >NUL 2>&1
    echo *** Download completed. ***
) ELSE (
    echo %installname% file already exists.
)

:: Extraction and Installation
color 1f
echo *** Extracting... ***
D:\Ajay_prefix\.Resources\winrar.exe x "D:\Ajay_prefix\wget_files\d3d\%installname%.zip" "C:\windows\temp\" -r -y >NUL 2>&1

echo *** Installing... ***
if exist "C:\windows\temp\%installname%\x64" (
    ren "C:\windows\temp\%installname%\x64" system32
    Xcopy /s /y "C:\windows\temp\%installname%\system32\" "C:\windows\system32\" /E /H /C /I
) else (
    echo Missing x64 folder.
)

if exist "C:\windows\temp\%installname%\x32" (
    ren "C:\windows\temp\%installname%\x32" syswow64
    Xcopy /s /y "C:\windows\temp\%installname%\syswow64\" "C:\windows\syswow64\" /E /H /C /I
) else (
    echo Missing x32 folder.
)

echo ************************************************
timeout.exe 5 /nobreak >NUL 2>&1
pause