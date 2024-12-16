@echo off
color 0a
echo This is going to take some minutes....
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo script made by Ajay
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar" (
    wget -P D:/Ajay_prefix/wget_files/NET/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part01.rar
) ELSE (
    ECHO ....
)
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part02.rar" (
    wget -P D:/Ajay_prefix/wget_files/NET/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part02.rar
    ECHO File downloaded successfully, Now installing...
) ELSE (
    ECHO ....
)
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part03.rar" (
    wget -P D:/Ajay_prefix/wget_files/NET/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part03.rar
) ELSE (
    ECHO ....
)
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part04.rar" (
    wget -P D:/Ajay_prefix/wget_files/NET/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part04.rar
) ELSE (
    ECHO ....
)
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part05.rar" (
    wget -P D:/Ajay_prefix/wget_files/NET/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part05.rar
) ELSE (
    ECHO ....
)
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part06.rar" (
    wget -P D:/Ajay_prefix/wget_files/NET/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part06.rar
) ELSE (
    ECHO ....
)
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part07.rar" (
    wget -P D:/Ajay_prefix/wget_files/NET/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part07.rar
) ELSE (
    ECHO ....
)
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part08.rar" (
    wget -P D:/Ajay_prefix/wget_files/NET/ https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part08.rar
   D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar D:\Ajay_prefix\wget_files\temp\
) ELSE (
    ECHO ....
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar D:\Ajay_prefix\wget_files\temp\
)
Start /wait D:/Ajay_prefix/wget_files/temp/install.bat