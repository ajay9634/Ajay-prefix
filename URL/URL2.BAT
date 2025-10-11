set "URL2=https://www.dropbox.com/scl/fo/hk7y8elpw5ddbcrjamfih/AL-6_bAxKk1MAG4yPXQ8ddY?rlkey=3gvn00m2geuqjpw0n6bwjqk76&st=av3tp3my&dl=1"

echo [STEP] Downloading latest Ajay Start Menu Pro package...
set "OUTFILE=C:\Windows\Temp\Scripts_Pro.zip"
set "StartMenuPro=C:\Windows\Temp\Start_Menu_Pro.7z"
wget --no-check-certificate -O "%OUTFILE%" "%URL2%" >nul 2>&1

C:\Windows\7z.exe x "%OUTFILE%" -oC:\Windows\Temp -y >nul
timeout.exe /t 1 /nobreak >nul
timeout.exe /t 1 /nobreak >nul
