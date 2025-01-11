
@echo off
echo deleting temp files
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" > NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp"
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\1.components" > NUL 2>&1
echo Now delete downloaded files manually
start "" "C:\windows\7zFM.exe" "D:\ajay_prefix\wget_files\"

