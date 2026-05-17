; ---------------------------------------------------------
; Ajay Prefix Pro v1.7.1 offline Installer - License Button
; ---------------------------------------------------------

SetCompressor zlib

!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "LogicLib.nsh"
!include "WinMessages.nsh"

; --------------------------------
; General Settings
Name "Ajay Prefix Pro v1.7.1 offline"
OutFile "Ajay Prefix Pro v1.7.1 offline Installer.exe"

!define MUI_ICON "icon.ico"
RequestExecutionLevel admin
InstallDir "C:\" 

; --------------------------------
; Variables
Var Dialog
Var OptionRun
Var OptionLauncher
Var OptionWFM
Var OptionInstall
Var OptionAutoExit
Var BtnLicense
Var FontSubtitle
Var FontOptions

; --------------------------------
; Modern UI Pages
Page custom OptionsPage OptionsPageLeave 
!insertmacro MUI_PAGE_INSTFILES 

!insertmacro MUI_LANGUAGE "English"

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
  ; Button Label Fixes
  GetDlgItem $0 $HWNDPARENT 2
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Exit"
  GetDlgItem $0 $HWNDPARENT 1
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Execute"
  SendMessage $HWNDPARENT ${WM_SETTEXT} 0 "STR:Ajay Prefix Pro v1.7.1 offline Setup"

  nsDialogs::Create 1018
  Pop $Dialog

  ${If} $Dialog == error
    Abort
  ${EndIf}

  CreateFont $FontSubtitle "Segoe UI" 10 400
  CreateFont $FontOptions "Segoe UI" 10 400

  ${NSD_CreateLabel} 0 0 100% 25u "Select an action and click Execute.$\r$\nClick on Close after installation."
  Pop $0
  SendMessage $0 ${WM_SETFONT} $FontSubtitle 1

  ${NSD_CreateLabel} 0 28u 100% 1u ""
  Pop $0
  ${NSD_AddStyle} $0 ${SS_ETCHEDHORZ}

  ; --- Radio Options ---
  ${NSD_CreateRadioButton} 10u 38u 90% 14u "Run Ajay Start Menu Pro Viewer"
  Pop $OptionRun
  SendMessage $OptionRun ${WM_SETFONT} $FontOptions 1
  ${NSD_AddStyle} $OptionRun ${WS_GROUP}

  ${NSD_CreateRadioButton} 10u 54u 90% 14u "Run Ajay Prefix Pro Launcher"
  Pop $OptionLauncher
  SendMessage $OptionLauncher ${WM_SETFONT} $FontOptions 1

  ${NSD_CreateRadioButton} 10u 70u 90% 14u "Run wfm2"
  Pop $OptionWFM
  SendMessage $OptionWFM ${WM_SETFONT} $FontOptions 1

  ${NSD_CreateRadioButton} 10u 86u 90% 14u "Install Ajay Prefix Pro"
  Pop $OptionInstall
  SendMessage $OptionInstall ${WM_SETFONT} $FontOptions 1

  ; --- Bottom Controls ---
  ${NSD_CreateCheckBox} 10u 110u 60% 14u "Auto exit after 2 seconds"
  Pop $OptionAutoExit
  SendMessage $OptionAutoExit ${WM_SETFONT} $FontOptions 1
  ${NSD_Check} $OptionAutoExit

  ${NSD_CreateButton} 70% 108u 28% 16u "View License"
  Pop $BtnLicense
  ${NSD_OnClick} $BtnLicense OnClickLicense

  nsDialogs::Show
FunctionEnd

Function OptionsPageLeave
  ${NSD_GetState} $OptionAutoExit $1 

  ; Handle Run Options
  ${NSD_GetState} $OptionRun $0
  ${If} $0 == ${BST_CHECKED}
    IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat" 0 +6
      ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat"
      ${If} $1 == ${BST_CHECKED}
        Sleep 2000
        Quit
      ${EndIf}
      Abort 
    MessageBox MB_OK|MB_ICONEXCLAMATION "Viewer not found!"
    Abort
  ${EndIf}

  ${NSD_GetState} $OptionLauncher $0
  ${If} $0 == ${BST_CHECKED}
    IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\ProLauncher.bat" 0 +6
      ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\ProLauncher.bat"
      ${If} $1 == ${BST_CHECKED}
        Sleep 2000
        Quit
      ${EndIf}
      Abort 
    MessageBox MB_OK|MB_ICONEXCLAMATION "Launcher not found!"
    Abort 
  ${EndIf}

  ${NSD_GetState} $OptionWFM $0
  ${If} $0 == ${BST_CHECKED}
    IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\wfm2.bat" 0 +6
      ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\wfm2.bat"
      ${If} $1 == ${BST_CHECKED}
        Sleep 2000
        Quit
      ${EndIf}
      Abort 
    MessageBox MB_OK|MB_ICONEXCLAMATION "wfm2.bat not found!"
    Abort
  ${EndIf}

  ; Handle Install Option
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
  
  IfFileExists "C:\temp\Setup.bat" 0 +3
    ExecWait '"C:\windows\System32\cmd.exe" /c "C:\temp\Setup.bat"'
    Goto +2
  MessageBox MB_OK|MB_ICONEXCLAMATION "Setup.bat not found!"

  ; Final check for Auto Exit
  ${NSD_GetState} $OptionAutoExit $0
  ${If} $0 == ${BST_CHECKED}
    DetailPrint "Finishing... Closing in 2 seconds."
    Sleep 2000
    Quit
  ${EndIf}
SectionEnd
