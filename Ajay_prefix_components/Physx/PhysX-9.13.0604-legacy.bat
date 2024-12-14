@echo off
color 0a
echo script made by Ajay
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
IF EXIST "D:/Ajay_prefix/wget_files/physx/PhysX-9.13.0604-SystemSoftware-Legacy.din" (   copy  "D:/Ajay_prefix/wget_files/physx/PhysX-9.13.0604-SystemSoftware-Legacy.din"  "D:/Ajay_prefix/wget_files/temp/PhysX-9.13.0604-SystemSoftware-Legacy.msi"
    ECHO copying...
) ELSE (
    ECHO File not found, downloading....
)
IF NOT EXIST "D:/Ajay_prefix/wget_files/physx/PhysX-9.13.0604-SystemSoftware-Legacy.din" (
    wget -O D:/Ajay_prefix/wget_files/physx/PhysX-9.13.0604-SystemSoftware-Legacy.din https://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi
    copy  "D:/Ajay_prefix/wget_files/physx/PhysX-9.13.0604-SystemSoftware-Legacy.din"  "D:/Ajay_prefix/wget_files/temp/PhysX-9.13.0604-SystemSoftware-Legacy.msi"
    ECHO downloaded, installing...
) ELSE (
    ECHO installing....
)
Start /wait  D:/Ajay_prefix/wget_files/temp/PhysX-9.13.0604-SystemSoftware-Legacy.msi
