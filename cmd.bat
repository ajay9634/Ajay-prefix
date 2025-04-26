@echo off
echo [INFO] Adding 7zFM registry

:: Associate extensions silently with 7-Zip types
reg add "HKCR\.7z" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.xz" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.txz" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.7z.xz" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.tzst" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.tar" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.gz" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.bz2" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.lz" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.zst" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.lzma" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.tgz" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.tbz2" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.tlz" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.iso" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.rar" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.zip" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.cab" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.deb" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.wcp" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.zip" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.bzip2" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.gzip" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.lzma" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.rpm" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.gz" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.bz2" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.swm" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.esd" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.ar" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.cpio" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.dmg" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.lzh" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.vdi" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.vhd" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.vmdk" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.z" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.udf" /ve /d "7-Zip.archive" /f >nul 2>&1
reg add "HKCR\.hfs" /ve /d "7-Zip.archive" /f >nul 2>&1

:: 7-Zip archive type
reg add "HKCR\7-Zip.archive" /ve /d "Compressed Archive" /f >nul 2>&1
reg add "HKCR\7-Zip.archive\DefaultIcon" /ve /d "C:\\windows\\7z.dll,2" /f >nul 2>&1
reg add "HKCR\7-Zip.archive\Shell\Open\Command" /ve /d "\"C:\\windows\\7zFM.exe\" \"%%1\"" /f >nul 2>&1

reg add "HKCU\Software\7-Zip\FM" /v ShowRealFileIcons /t REG_DWORD /d 1 /f >nul 2>&1

echo [INFO] Adding Notepad registry
reg add "HKCR\.txt" /ve /d "txtfile" /f >nul
reg add "HKCR\.cfg" /ve /d "txtfile" /f >nul
reg add "HKCR\.conf" /ve /d "txtfile" /f >nul
reg add "HKCR\.ini" /ve /d "txtfile" /f >nul
reg add "HKCR\.log" /ve /d "txtfile" /f >nul
reg add "HKCR\.config" /ve /d "txtfile" /f >nul
reg add "HKCR\.xml" /ve /d "txtfile" /f >nul
reg add "HKCR\.json" /ve /d "txtfile" /f >nul
reg add "HKCR\.yaml" /ve /d "txtfile" /f >nul
reg add "HKCR\.yml" /ve /d "txtfile" /f >nul
reg add "HKCR\.csv" /ve /d "txtfile" /f >nul
reg add "HKCR\.md" /ve /d "txtfile" /f >nul
reg add "HKCR\.properties" /ve /d "txtfile" /f >nul
reg add "HKCR\.html" /ve /d "txtfile" /f >nul
reg add "HKCR\.htm" /ve /d "txtfile" /f >nul
reg add "HKCR\.css" /ve /d "txtfile" /f >nul
reg add "HKCR\.js" /ve /d "txtfile" /f >nul

reg add "HKCR\txtfile" /ve /d "Text Document" /f >nul
reg add "HKCR\txtfile\DefaultIcon" /ve /d "C:\windows\system32\imageres.dll,-102" /f >nul
reg add "HKCR\txtfile\shell" /f >nul
reg add "HKCR\txtfile\shell\open" /f >nul
reg add "HKCR\txtfile\shell\open\command" /ve /d "\"C:\windows\system32\notepad.exe\" \"%%1\"" /f >nul
