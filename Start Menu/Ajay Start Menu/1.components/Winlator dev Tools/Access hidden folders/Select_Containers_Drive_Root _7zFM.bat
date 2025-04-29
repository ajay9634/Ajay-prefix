@echo off
:choice 
echo Enter the container number (e.g., 1, 2, 3, etc.):
set /p user_number="Enter xuser number: "

for /f "tokens=* delims=0123456789" %%a in ("%user_number%") do (
    echo Invalid input! Please enter a valid number.
    goto choice
)

start "" "C:\windows\7zFM.exe" "Z:\home\xuser-%user_number%\.wine\"
timeout /t 2 >nul
exit
