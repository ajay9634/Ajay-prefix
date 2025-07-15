set "URL=https://www.dropbox.com/scl/fo/3zp5mkv3cpeg8kc11zdet/ALLcNRTH04hX6llvzumIZ4I?rlkey=32sq7ibs60t8nhl0faanminso&st=2jo5x55e&dl=1"

echo [STEP] Downloading latest Ajay Start Menu package...
set "OUTFILE=C:\Windows\Temp\Scripts.zip"
set "StartMenu=C:\Windows\Temp\Start_Menu.7z"
wget --no-check-certificate -O "%OUTFILE%" "%URL%" >nul 2>&1

C:\Windows\7z.exe x "%OUTFILE%" -oC:\Windows\Temp -y >nul
timeout.exe /t 1 /nobreak >nul
timeout.exe /t 1 /nobreak >nul
