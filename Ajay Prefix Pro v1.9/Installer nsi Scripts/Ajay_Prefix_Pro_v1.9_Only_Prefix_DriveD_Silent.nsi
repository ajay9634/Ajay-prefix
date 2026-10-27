; ---------------------------------------------------------
; Ajay Prefix Pro v1.9 Installer - Drive D Verified Auto-Installer
; ---------------------------------------------------------

SetCompressor zlib

!include "MUI2.nsh"
!include "LogicLib.nsh"

; --------------------------------
; General Settings
Name "Ajay Prefix Pro v1.9 (Only Prefix) - Drive D Silent"
OutFile "Ajay_Prefix_Pro_v1.9_Only_Prefix_DriveD_Silent.exe"

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
; Pre-Installation Checks (Wine & Drive D)
; --------------------------------
Function .onInit
    ; 1. Pure Registry Check: Verify existence of HKCU\Software\Wine
    ClearErrors
    EnumRegKey $0 HKCU "Software\Wine" 0
    
    ${If} $0 == ""
        MessageBox MB_OK|MB_ICONSTOP "Wine Environment Not Detected!$\n$\nThis installer requires a Wine environment (HKCU\Software\Wine) to run. Installation cannot continue."
        Abort
    ${EndIf}

    ; 2. Check if D:\ exists and is accessible
    IfFileExists "D:\*.*" drive_exists 0
        MessageBox MB_OK|MB_ICONSTOP "Error: Drive D is not found or accessible!"
        Abort

drive_exists:
    ; 3. Check if D:\ is writable by attempting to write a temporary test file
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
  
  ; Launch AutoIt script asynchronously without waiting for it to finish
  IfFileExists "C:\temp\AutoIt3_x64.exe" 0 +2
    Exec '"C:\temp\AutoIt3_x64.exe" "C:\temp\Install_Setup.ajau3"'

  ; Wait for 2 seconds (2000 milliseconds) before letting the installer close
  Sleep 2000
      SectionEnd
      
