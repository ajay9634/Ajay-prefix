@echo off

echo [INFO] Adding wfm2 registry to open folders and drives

reg add "HKEY_CLASSES_ROOT\Folder\shell\open\command" /ve /d "C:\\windows\\wfm2.exe \"%%1\"" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\Drive\shell\open\command" /ve /d "C:\\windows\\wfm2.exe \"%%1\"" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\shell\open\command" /ve /d "C:\\windows\\wfm2.exe \"%%1\"" /f >nul 2>&1

echo [INFO] Updating bat and cmd icons
reg add "HKCR\.bat" /ve /d "AjayBatchFile" /f >nul
reg add "HKCR\AjayBatchFile" /ve /d "Ajay Batch Script" /f >nul
reg add "HKCR\AjayBatchFile\DefaultIcon" /ve /d "\"%SystemRoot%\\System32\\cmd.exe\",0" /f >nul
reg add "HKCR\AjayBatchFile\Shell" /ve /d "open" /f >nul
reg add "HKCR\AjayBatchFile\Shell\open\command" /ve /d "\"%SystemRoot%\\System32\\cmd.exe\" /c \"%%1\" %%*" /f >nul

reg add "HKCR\.cmd" /ve /d "AjayCmdFile" /f >nul
reg add "HKCR\AjayCmdFile" /ve /d "Ajay CMD Script" /f >nul
reg add "HKCR\AjayCmdFile\DefaultIcon" /ve /d "\"%SystemRoot%\\System32\\cmd.exe\",0" /f >nul
reg add "HKCR\AjayCmdFile\Shell" /ve /d "open" /f >nul
reg add "HKCR\AjayCmdFile\Shell\open\command" /ve /d "\"%SystemRoot%\\System32\\cmd.exe\" /c \"%%1\" %%*" /f >nul

echo [INFO] Adding openal32 as native,builtin 
reg add "HKCU\Software\Wine\DllOverrides" /v openal32 /t REG_SZ /d native,builtin /f >nul

echo [INFO] Updating .reg file icon and behavior
reg add "HKCR\.reg" /ve /d "AjayRegFile" /f >nul
reg add "HKCR\AjayRegFile" /ve /d "Ajay Registry File" /f >nul
reg add "HKCR\AjayRegFile\DefaultIcon" /ve /d "\"%SystemRoot%\\regedit.exe\",0" /f >nul
reg add "HKCR\AjayRegFile\Shell" /ve /d "open" /f >nul
reg add "HKCR\AjayRegFile\Shell\open\command" /ve /d "\"%SystemRoot%\\regedit.exe\" /s \"%%1\"" /f >nul

start "" wscript.exe "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\README.VBS"
