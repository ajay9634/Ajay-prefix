@echo off
echo Exporting all applied env variables info to drive D as txt ...
set /p fname=Type name : 
set outfile=D:\%fname% environment variables.txt
echo Saving environment variables to %outfile%...
set > "%outfile%"
echo Done!
pause
