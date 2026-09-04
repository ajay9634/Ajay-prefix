; ---------------------------------------------------------
; Ajay Prefix Pro v1.8 Installer - Drive D Verified Auto-Installer
; ---------------------------------------------------------

SetCompressor zlib

!include "MUI2.nsh"
!include "LogicLib.nsh"

; --------------------------------
; General Settings
Name "Ajay Prefix Pro v1.8 (Only Prefix) - Drive D Silent"
OutFile "Ajay Prefix Pro v1.8 Installer Silent.exe"

!define MUI_ICON "icon.ico"
RequestExecutionLevel admin
InstallDir "C:\" 

; Auto-close the installer window when finished without user intervention
AutoCloseWindow true

; --------------------------------
; Modern UI Pages
!insertmacro MUI_PAGE_INSTFILES 

!insertmacro MUI_LANGUAGE "English"

; --------------------------------
; Pre-Installation Check for Drive D
; --------------------------------
Function .onInit
    ; 1. Check if D:\ exists and is accessible
    IfFileExists "D:\*.*" drive_exists 0
        MessageBox MB_OK|MB_ICONSTOP "Error: Drive D is not found or accessible!"
        Abort

drive_exists:
    ; 2. Check if D:\ is writable by attempting to write a temporary test file
    ClearErrors
    FileOpen $0 "D:\~write_test.tmp" "w"
    ${If} ${Errors}
        MessageBox MB_OK|MB_ICONSTOP "Error: Drive D is found, but it is not writable!"
        Abort
    ${EndIf}

    ; Clean up the test file
    FileClose $0
    Delete "D:\~write_test.tmp"
FunctionEnd

; --------------------------------
; Auto-Exit Function
; --------------------------------
Function .onInstSuccess
    Quit
FunctionEnd

; --------------------------------
; Main Execution
; --------------------------------
Section "Main"
  SetDetailsPrint textonly
  DetailPrint "Unpacking Ajay Prefix Pro..."
  SetOutPath "C:\"
  File /r "Setup\*.*"
  
  ; Execute Setup.bat completely hidden using nsExec plugin
  IfFileExists "C:\temp\Setup.bat" 0 +2
    nsExec::execToStack '"C:\windows\System32\cmd.exe" /c "C:\temp\Setup.bat"'

SectionEnd
