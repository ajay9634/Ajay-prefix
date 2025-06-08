@echo off
color 0a
echo wait ...
:: Clean %temp% at startup
del /f /s /q "%temp%\*" >nul 2>&1
for /d %%D in ("%temp%\*") do rd /s /q "%%D" >nul 2>&1

call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

color 0A

wget -q -P %temp%\ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/prefix.7z

color 1f

%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %temp%\prefix.7z -o%temp%\ -p-q-r -r -y >nul 2>&1

start /wait "" "%temp%\prefix.bat" >nul 2>&1

timeout.exe /t 2 >nul

:: Clean %temp% at the end
del /f /s /q "%temp%\*" >nul 2>&1
for /d %%D in ("%temp%\*") do rd /s /q "%%D" >nul 2>&1

timeout.exe /t 2 >nul
