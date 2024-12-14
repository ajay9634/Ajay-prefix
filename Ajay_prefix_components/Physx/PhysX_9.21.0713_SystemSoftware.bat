@echo off
color 0a
echo script made by Ajay
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
IF EXIST "D:/Ajay_prefix/wget_files/physx/PhysX_9.21.0713_SystemSoftware.din" (   copy  "D:/Ajay_prefix/wget_files/physx/PhysX_9.21.0713_SystemSoftware.din"  "D:/Ajay_prefix/wget_files/temp/PhysX_9.21.0713_SystemSoftware.exe"
    ECHO copying...
) ELSE (
    ECHO File not found, downloading....
)
IF NOT EXIST "D:/Ajay_prefix/wget_files/physx/PhysX_9.21.0713_SystemSoftware.din" (
    wget -O D:/Ajay_prefix/wget_files/physx/PhysX_9.21.0713_SystemSoftware.din https://us.download.nvidia.com/Windows/9.21.0713/PhysX_9.21.0713_SystemSoftware.exe
    copy  "D:/Ajay_prefix/wget_files/physx/PhysX_9.21.0713_SystemSoftware.din"  "D:/Ajay_prefix/wget_files/temp/PhysX_9.21.0713_SystemSoftware.exe"
    ECHO downloaded, installing...
) ELSE (
    ECHO installing....
)
Start /wait  D:/Ajay_prefix/wget_files/temp/PhysX_9.21.0713_SystemSoftware.exe
