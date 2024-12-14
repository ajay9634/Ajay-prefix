@echo off
color 0a
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo script made by Ajay
IF NOT EXIST "D:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part1.rar" (
    wget -P D:/Ajay_prefix/wget_files/physx/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/PhysX_8.04.25_SystemSoftware.part1.rar
) ELSE (
    ECHO installing....
)
IF NOT EXIST "D:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part2.rar" (
    wget -P D:/Ajay_prefix/wget_files/physx/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/PhysX_8.04.25_SystemSoftware.part2.rar
D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part1.rar D:\Ajay_prefix\wget_files\temp\
    ECHO File downloaded successfully, Now installing...
) ELSE (
    ECHO installing....
 D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\physx\PhysX_8.04.25_SystemSoftware.part1.rar D:\Ajay_prefix\wget_files\temp\
)
Start /wait D:/Ajay_prefix/wget_files/temp/PhysX_8.04.25_SystemSoftware.exe