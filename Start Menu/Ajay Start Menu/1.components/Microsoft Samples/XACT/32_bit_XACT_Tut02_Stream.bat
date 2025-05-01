@echo off
color 0a
if exist "D:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XACT\Bin\x86\Tut02_Stream.lnk" goto Run

echo *** deleting temp2 files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp2" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp2" >NUL 2>&1
echo *** Script made by Ajay ***

:: Downloading Microsoft Samples if it doesn't exist
echo *** Checking for Microsoft Samples ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\Microsoft_Samples.7z" (
    echo *** Downloading Microsoft Samples...***
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp2/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Microsoft_Samples.7z
    copy /y D:\Ajay_prefix\wget_files\temp2\Microsoft_Samples.7z D:\Ajay_prefix\wget_files\Files\
) ELSE (
    echo *** File already exists.***
)

:Run
:: Extracting Microsoft Samples
color 1f
color 1f
echo *** Opening Microsoft Samples ***
:: Define target and shortcut paths
set "targetPath=D:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XACT\Bin\x86\Tut02_Stream.exe"
set "shortcutPath=D:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XACT\Bin\x86\Tut02_Stream.lnk"
set "workingDir=D:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XACT\Bin\x86"

:: Create a temporary VBScript file
set "vbsFile=%TEMP%\create_link.vbs"
> "%vbsFile%" echo Set shell = CreateObject("WScript.Shell")
>> "%vbsFile%" echo Set shortcut = shell.CreateShortcut("%shortcutPath%")
>> "%vbsFile%" echo shortcut.TargetPath = "%targetPath%"
>> "%vbsFile%" echo shortcut.WorkingDirectory = "%workingDir%"
>> "%vbsFile%" echo shortcut.Save

:: Run the VBScript
cscript //nologo "%vbsFile%"

:: Clean up
del "%vbsFile%"

Start ""  D:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XACT\Bin\x86\Tut02_Stream.lnk

echo ************************************************
timeout.exe /t 3 >nul