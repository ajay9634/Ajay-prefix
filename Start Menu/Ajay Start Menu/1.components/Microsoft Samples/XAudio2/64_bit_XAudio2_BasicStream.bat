@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
if exist "%drive_letter%:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XAudio2\Bin\x64\XAudio2BasicStream.lnk" goto Run

echo *** deleting temp2 files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp2" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp2" >NUL 2>&1
echo *** Script made by Ajay ***

:Run
:: Extracting Microsoft Samples
color 1f
echo *** Opening Microsoft Samples ***
:: Define target and shortcut paths
set "targetPath=%drive_letter%:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XAudio2\Bin\x64\XAudio2BasicStream.exe"
set "shortcutPath=%drive_letter%:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XAudio2\Bin\x64\XAudio2BasicStream.lnk"
set "workingDir=%drive_letter%:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XAudio2\Bin\x64"

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

Start ""  %drive_letter%:\Ajay_prefix\wget_files\temp2\Microsoft_Samples\C++\XAudio2\Bin\x64\XAudio2BasicStream.lnk

echo ************************************************
timeout.exe /t 3 >nul