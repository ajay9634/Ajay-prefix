; ---------------------------------------------------------
; Ajay Prefix Pro v1.9 Installer - License Button & Wine Check
; ---------------------------------------------------------

SetCompressor zlib

!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "LogicLib.nsh"
!include "WinMessages.nsh"

; --------------------------------
; General Settings
Name "Ajay Prefix Pro v1.9 offline"
OutFile "Ajay_Prefix_Pro_v1.9_offline_Installer.exe"

!define MUI_ICON "icon.ico"
RequestExecutionLevel admin
InstallDir "C:\" 

; Removed AutoCloseWindow true so it respects manual finishes when Auto Exit is unchecked

; --------------------------------
; Variables
Var Dialog
Var OptionRun
Var OptionLauncher
Var OptionWFM
Var OptionUpdate
Var OptionStatus
Var OptionInstall
Var OptionAutoExit
Var BtnLicense
Var FontSubtitle
Var FontOptions

; Global state to hold Auto Exit preference after dialog is destroyed
Var AutoExitState

; File Existence Flags
Var HasRunFile
Var HasLauncherFile
Var HasWFMFile
Var HasUpdateFile
Var HasStatusFile

; Dynamic Control Positioning
Var CurrentY

; --------------------------------
; Modern UI Pages
Page custom OptionsPage OptionsPageLeave 
!insertmacro MUI_PAGE_INSTFILES 

!insertmacro MUI_LANGUAGE "English"

; --------------------------------
; Function: .onInit (Runs immediately on launch)
; --------------------------------
Function .onInit
  ; Pure Registry Check: Verify existence of HKCU\Software\Wine
  ClearErrors
  
  ; EnumRegKey checks if the registry key exists. 
  ; If it doesn't exist, $0 is empty and the error flag is tripped.
  EnumRegKey $0 HKCU "Software\Wine" 0
  
  ${If} $0 == ""
    MessageBox MB_OK|MB_ICONSTOP "Wine Environment Not Detected!$\n$\nThis installer requires a Wine environment (HKCU\Software\Wine) to run. Installation cannot continue."
    Abort
  ${EndIf}
FunctionEnd

; --------------------------------
; Function to Open License File
; --------------------------------
Function OnClickLicense
    ; Extract license.txt to a temporary folder so it can be viewed
    InitPluginsDir
    File /oname=$PLUGINSDIR\license.txt "license.txt"
    ExecShell "open" "$PLUGINSDIR\license.txt"
FunctionEnd

; --------------------------------
; Custom Menu Page
; --------------------------------
Function OptionsPage
  ; Hide MUI Header elements (Title, Subtitle, Header Icon, and White Box)
  GetDlgItem $0 $HWNDPARENT 1034
  ShowWindow $0 0
  GetDlgItem $0 $HWNDPARENT 1037
  ShowWindow $0 0
  GetDlgItem $0 $HWNDPARENT 1038
  ShowWindow $0 0
  GetDlgItem $0 $HWNDPARENT 1039
  ShowWindow $0 0

  ; Pre-check presence of target files for all options
  StrCpy $HasRunFile 0
  IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat" 0 +2
    StrCpy $HasRunFile 1

  StrCpy $HasLauncherFile 0
  IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\ProLauncher.bat" 0 +2
    StrCpy $HasLauncherFile 1

  StrCpy $HasWFMFile 0
  IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\wfm2.bat" 0 +2
    StrCpy $HasWFMFile 1

  StrCpy $HasUpdateFile 0
  IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\Update Scripts Pro v1.9.lnk" 0 +2
    StrCpy $HasUpdateFile 1

  StrCpy $HasStatusFile 0
  IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Check_Ajay_Prefix_Pro_Status.bat" 0 +2
    StrCpy $HasStatusFile 1

  ; Button Label Fixes
  GetDlgItem $0 $HWNDPARENT 2
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Exit"
  GetDlgItem $0 $HWNDPARENT 1
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Execute"
  SendMessage $HWNDPARENT ${WM_SETTEXT} 0 "STR:Ajay Prefix Pro v1.9 Offline Installer"

  nsDialogs::Create 1018
  Pop $Dialog

  ${If} $Dialog == error
    Abort
  ${EndIf}

  ; Shift the dialog control area up to remove the blank header gap
  System::Call 'user32::SetWindowPos(i $Dialog, i 0, i 13, i 10, i 470, i 280, i 0x0014)'

  CreateFont $FontSubtitle "Segoe UI" 10 400
  CreateFont $FontOptions "Segoe UI" 10 400

  ; Top label text
  ${NSD_CreateLabel} 0 0 100% 25u "Choose your preferred action below and click Execute."
  Pop $0
  SendMessage $0 ${WM_SETFONT} $FontSubtitle 1

  ${NSD_CreateLabel} 0 25u 100% 1u ""
  Pop $0
  ${NSD_AddStyle} $0 ${SS_ETCHEDHORZ}

  ; Base starting Y coordinate for radio options
  IntOp $CurrentY 0 + 35

  ; --- Option 1: Run Viewer ---
  ${If} $HasRunFile == 1
    ${NSD_CreateRadioButton} 10u $CurrentYu 90% 14u "Run Ajay Start Menu Pro Viewer"
    Pop $OptionRun
    SendMessage $OptionRun ${WM_SETFONT} $FontOptions 1
    ${NSD_AddStyle} $OptionRun ${WS_GROUP}
    IntOp $CurrentY $CurrentY + 16
  ${EndIf}

  ; --- Option 2: Run Launcher ---
  ${If} $HasLauncherFile == 1
    ${NSD_CreateRadioButton} 10u $CurrentYu 90% 14u "Run Ajay Prefix Pro Launcher"
    Pop $OptionLauncher
    SendMessage $OptionLauncher ${WM_SETFONT} $FontOptions 1
    ${If} $HasRunFile == 0
      ${NSD_AddStyle} $OptionLauncher ${WS_GROUP}
    ${EndIf}
    IntOp $CurrentY $CurrentY + 16
  ${EndIf}

  ; --- Option 3: Run wfm2 ---
  ${If} $HasWFMFile == 1
    ${NSD_CreateRadioButton} 10u $CurrentYu 90% 14u "Run wfm2"
    Pop $OptionWFM
    SendMessage $OptionWFM ${WM_SETFONT} $FontOptions 1
    ${If} $HasRunFile == 0
      ${If} $HasLauncherFile == 0
        ${NSD_AddStyle} $OptionWFM ${WS_GROUP}
      ${EndIf}
    ${EndIf}
    IntOp $CurrentY $CurrentY + 16
  ${EndIf}

  ; --- Option 4: Update Scripts ---
  ${If} $HasUpdateFile == 1
    ${NSD_CreateRadioButton} 10u $CurrentYu 90% 14u "Update Scripts Pro v1.9"
    Pop $OptionUpdate
    SendMessage $OptionUpdate ${WM_SETFONT} $FontOptions 1
    ${If} $HasRunFile == 0
      ${If} $HasLauncherFile == 0
        ${If} $HasWFMFile == 0
          ${NSD_AddStyle} $OptionUpdate ${WS_GROUP}
        ${EndIf}
      ${EndIf}
    ${EndIf}
    IntOp $CurrentY $CurrentY + 16
  ${EndIf}

  ; --- Option 5: Check Status ---
  ${If} $HasStatusFile == 1
    ${NSD_CreateRadioButton} 10u $CurrentYu 90% 14u "Check Ajay Prefix Pro Status"
    Pop $OptionStatus
    SendMessage $OptionStatus ${WM_SETFONT} $FontOptions 1
    ${If} $HasRunFile == 0
      ${If} $HasLauncherFile == 0
        ${If} $HasWFMFile == 0
          ${If} $HasUpdateFile == 0
            ${NSD_AddStyle} $OptionStatus ${WS_GROUP}
          ${EndIf}
        ${EndIf}
      ${EndIf}
    ${EndIf}
    IntOp $CurrentY $CurrentY + 16
  ${EndIf}

  ; --- Option 6: Install (Always Present) ---
  ${NSD_CreateRadioButton} 10u $CurrentYu 90% 14u "Install Ajay Prefix Pro"
  Pop $OptionInstall
  SendMessage $OptionInstall ${WM_SETFONT} $FontOptions 1
  ${If} $HasRunFile == 0
    ${If} $HasLauncherFile == 0
      ${If} $HasWFMFile == 0
        ${If} $HasUpdateFile == 0
          ${If} $HasStatusFile == 0
            ${NSD_AddStyle} $OptionInstall ${WS_GROUP}
          ${EndIf}
        ${EndIf}
      ${EndIf}
    ${EndIf}
  ${EndIf}
  IntOp $CurrentY $CurrentY + 24

  ; --- Bottom Controls ---
  ${NSD_CreateCheckBox} 10u $CurrentYu 60% 14u "Auto exit after 3 seconds"
  Pop $OptionAutoExit
  SendMessage $OptionAutoExit ${WM_SETFONT} $FontOptions 1
  ${NSD_Check} $OptionAutoExit

  IntOp $0 $CurrentY - 2
  ${NSD_CreateButton} 70% $0u 28% 16u "View License"
  Pop $BtnLicense
  ${NSD_OnClick} $BtnLicense OnClickLicense

  nsDialogs::Show
FunctionEnd

Function OptionsPageLeave
  ; Capture Auto Exit state globally while the window/controls still exist
  ${NSD_GetState} $OptionAutoExit $AutoExitState 

  ; Handle Option 1: Run Viewer
  ${If} $HasRunFile == 1
    ${NSD_GetState} $OptionRun $0
    ${If} $0 == ${BST_CHECKED}
      IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat" 0 +7
        ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat"
        ${If} $AutoExitState == ${BST_CHECKED}
          Sleep 3000
          Quit
        ${EndIf}
        Abort 
      MessageBox MB_OK|MB_ICONEXCLAMATION "Viewer not found!"
      Abort
    ${EndIf}
  ${EndIf}

  ; Handle Option 2: Run Launcher
  ${If} $HasLauncherFile == 1
    ${NSD_GetState} $OptionLauncher $0
    ${If} $0 == ${BST_CHECKED}
      IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\ProLauncher.bat" 0 +7
        ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\ProLauncher.bat"
        ${If} $AutoExitState == ${BST_CHECKED}
          Sleep 3000
          Quit
        ${EndIf}
        Abort 
      MessageBox MB_OK|MB_ICONEXCLAMATION "Launcher not found!"
      Abort 
    ${EndIf}
  ${EndIf}

  ; Handle Option 3: Run wfm2
  ${If} $HasWFMFile == 1
    ${NSD_GetState} $OptionWFM $0
    ${If} $0 == ${BST_CHECKED}
      IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\wfm2.bat" 0 +7
        ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\wfm2.bat"
        ${If} $AutoExitState == ${BST_CHECKED}
          Sleep 3000
          Quit
        ${EndIf}
        Abort 
      MessageBox MB_OK|MB_ICONEXCLAMATION "wfm2.bat not found!"
      Abort
    ${EndIf}
  ${EndIf}

  ; Handle Option 4: Update Scripts
  ${If} $HasUpdateFile == 1
    ${NSD_GetState} $OptionUpdate $0
    ${If} $0 == ${BST_CHECKED}
      IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\Update Scripts Pro v1.9.lnk" 0 +7
        Exec 'cmd.exe /c start "" "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\Update Scripts Pro v1.9.lnk"'
        ${If} $AutoExitState == ${BST_CHECKED}
          Sleep 3000
          Quit
        ${EndIf}
        Abort
      MessageBox MB_OK|MB_ICONEXCLAMATION "Update Scripts Pro v1.9.lnk not found!"
      Abort
    ${EndIf}
  ${EndIf}

  ; Handle Option 5: Check Status
  ${If} $HasStatusFile == 1
    ${NSD_GetState} $OptionStatus $0
    ${If} $0 == ${BST_CHECKED}
      IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\Check Ajay Prefix Pro Status.lnk" 0 +7
        Exec 'cmd.exe /c start "" "C:\AJAY_PREFIX_PRO\Ajay_Start_Menu_Pro\Check Ajay Prefix Pro Status.lnk"'
        ${If} $AutoExitState == ${BST_CHECKED}
          Sleep 3000
          Quit
        ${EndIf}
        Abort
      MessageBox MB_OK|MB_ICONEXCLAMATION "Check_Ajay_Prefix_Pro_Status.bat not found!"
      Abort
    ${EndIf}
  ${EndIf}

  ; Handle Option 6: Install Option
  ${NSD_GetState} $OptionInstall $0
  ${If} $0 == ${BST_CHECKED}
    ; Confirmation for installation
    MessageBox MB_YESNO|MB_ICONQUESTION "By clicking Yes, you agree to the terms in license.txt. Proceed with installation?" IDYES +2
    Abort
    Return 
  ${EndIf}
  Abort
FunctionEnd

; --------------------------------
; Main Execution
Section "Main"
  SetDetailsPrint textonly
  DetailPrint "Unpacking Ajay Prefix Pro..."
  SetOutPath "C:\"
  File /r "Setup\*.*"
  
  ; Launch AutoIt script asynchronously without waiting for it to complete
  IfFileExists "C:\temp\AutoIt3_x64.exe" 0 +3
    Exec '"C:\temp\AutoIt3_x64.exe" "C:\temp\Install_Setup.ajau3"'
    Goto +2
  MessageBox MB_OK|MB_ICONEXCLAMATION "AutoIt launcher not found!"

  ; Use global variable to check auto exit preference safely
  ${If} $AutoExitState == ${BST_CHECKED}
    DetailPrint "Finishing... Closing in 3 seconds."
    Sleep 3000
    Quit
  ${Else}
    DetailPrint "Installation complete."
  ${EndIf}
    SectionEnd
    
