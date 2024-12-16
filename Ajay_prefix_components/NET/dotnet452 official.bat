@echo off
color 7c
echo ==================================
echo Warning: Uninstall mono or other net framework , This is official setup and Tested in wine 8.0.2 kron4ek in winlator proot. installation will take a long time. Set windows version to 7 in winecfg.
echo ==================================
echo .
echo Now choose an option -
echo .
ECHO 1. install Net framework 4.5.2 official
ECHO 2. Cancel or exit
set choice=
set /p choice=Type the number to print text.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install
if '%choice%'=='2' goto cancel
ECHO "%choice%" is not valid, try again
ECHO.
goto end
:cancel 
ECHO cancelled
exit
goto start
:install
ECHO installing
echo script made by Ajay
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
IF EXIST "D:/Ajay_prefix/wget_files/NET/dotNetFx452_Full_x86_x64.din" (   copy  "D:/Ajay_prefix/wget_files/NET/dotNetFx452_Full_x86_x64.din"  "D:/Ajay_prefix/wget_files/temp/dotNetFx452_Full_x86_x64.exe"
    ECHO copying...
) ELSE (
    ECHO File not found, downloading....
)
IF NOT EXIST "D:/Ajay_prefix/wget_files/NET/dotNetFx452_Full_x86_x64.din" (
    wget -O D:/Ajay_prefix/wget_files/NET/dotNetFx452_Full_x86_x64.din https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe 6c2c589132e830a185c5f40f82042bee3022e721a216680bd9b3995ba86f3781
    copy  "D:/Ajay_prefix/wget_files/NET/dotNetFx452_Full_x86_x64.din"  "D:/Ajay_prefix/wget_files/temp/dotNetFx452_Full_x86_x64.exe"

    ECHO downloaded, installing...
) ELSE (
    ECHO installing....
)

Start D:/Ajay_prefix/wget_files/temp/dotNetFx452_Full_x86_x64.exe /force /norestart

exit