@echo off

echo Setting Wine DLL overrides...

reg add "HKCU\Software\Wine\DllOverrides" /v atmlib    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msjet40   /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msjint40  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msjter40  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msrd3x40  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v dao360    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v vbajet32  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v mtxdm     /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v ODBC32    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v ODBCCP32  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v oledb32   /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v mf        /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msls31    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v mspatcha  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v riched20  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v sqlite3   /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v jscript   /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v scrrun    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v vbscript  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v ole32 /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v oleaut32 /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v rpcrt4 /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v comcat /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2 /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2disp /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2nls /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v typelib /d builtin,native /f >nul 2>&1

timeout.exe 5 /nobreak >NUL 

reg add "HKCU\Software\Wine\DllOverrides" /v atmlib    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msjet40   /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msjint40  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msjter40  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msrd3x40  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v dao360    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v vbajet32  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v mtxdm     /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v ODBC32    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v ODBCCP32  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v oledb32   /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v mf        /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v msls31    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v mspatcha  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v riched20  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v sqlite3   /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v jscript   /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v scrrun    /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v vbscript  /d "builtin,native" /f >nul
reg add "HKCU\Software\Wine\DllOverrides" /v ole32 /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v oleaut32 /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v rpcrt4 /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v comcat /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2 /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2disp /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2nls /d builtin,native /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v typelib /d builtin,native /f >nul 2>&1
timeout.exe 3 /nobreak >NUL 