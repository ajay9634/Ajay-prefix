@echo off
echo Opening dgvoodoo.conf from %AppData%...
Start "" notepad.exe "%AppData%\dgVoodoo\dgVoodoo.conf"
timeout /t 3 >nul
