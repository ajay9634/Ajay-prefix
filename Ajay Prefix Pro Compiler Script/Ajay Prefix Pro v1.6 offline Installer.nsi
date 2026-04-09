; ---------------------------------------------------------
; Ajay Prefix Pro v1.6 offline Installer - Header Optimized
; ---------------------------------------------------------

SetCompressor zlib

!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "LogicLib.nsh"
!include "WinMessages.nsh"

; --------------------------------
; General Settings
Name "Ajay Prefix Pro v1.6 offline"
OutFile "Ajay Prefix Pro v1.6 offline Installer.exe"

; --- Icon Configuration ---
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
Var FontSubtitle
Var FontOptions

; --------------------------------
; Modern UI Pages
; Define the header text for the custom page
!define MUI_PAGE_HEADER_TEXT "Ajay Prefix Pro v1.6 offline"
!define MUI_PAGE_HEADER_SUBTEXT "Select an action below to proceed."

Page custom OptionsPage OptionsPageLeave 
!insertmacro MUI_PAGE_INSTFILES 

!insertmacro MUI_LANGUAGE "English"

; --------------------------------
; Custom Menu Page
Function OptionsPage
  ; Change "Cancel" button to "Exit"
  GetDlgItem $0 $HWNDPARENT 2
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Exit"

  ; Change "Next" button to "Execute"
  GetDlgItem $0 $HWNDPARENT 1
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Execute"

  SendMessage $HWNDPARENT ${WM_SETTEXT} 0 "STR:Ajay Prefix Pro v1.6 offline Setup"

  nsDialogs::Create 1018
  Pop $Dialog

  ${If} $Dialog == error
    Abort
  ${EndIf}

  ; --- Pro UI Styling ---
  CreateFont $FontSubtitle "Segoe UI" 10 400
  CreateFont $FontOptions "Segoe UI" 10 400

  ; --- Header Section (Moved up to Y=0 to close gap) ---
  ${NSD_CreateLabel} 0 0 100% 25u "Select an action and click Execute.$\r$\nSelect Exit when finished."
  Pop $0
  SendMessage $0 ${WM_SETFONT} $FontSubtitle 1

  ; --- Visual Separator ---
  ${NSD_CreateLabel} 0 28u 100% 1u ""
  Pop $0
  ${NSD_AddStyle} $0 ${SS_ETCHEDHORZ}

  ; --- Radio Options (Shifted up since title is now in Header) ---
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

  nsDialogs::Show
FunctionEnd

Function OptionsPageLeave
  ${NSD_GetState} $OptionRun $0
  ${If} $0 == ${BST_CHECKED}
    IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat" 0 +3
      ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat"
      Abort 
    MessageBox MB_OK|MB_ICONEXCLAMATION "Viewer not found!"
    Abort
  ${EndIf}

  ${NSD_GetState} $OptionLauncher $0
  ${If} $0 == ${BST_CHECKED}
    IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\ProLauncher.bat" 0 +3
      ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\ProLauncher.bat"
      Abort 
    MessageBox MB_OK|MB_ICONEXCLAMATION "Ajay Prefix Pro Launcher not found!"
    Abort 
  ${EndIf}

  ${NSD_GetState} $OptionWFM $0
  ${If} $0 == ${BST_CHECKED}
    IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\wfm2.bat" 0 +3
      ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\wfm2.bat"
      Abort 
    MessageBox MB_OK|MB_ICONEXCLAMATION "wfm2.bat not found!"
    Abort
  ${EndIf}

  ${NSD_GetState} $OptionInstall $0
  ${If} $0 == ${BST_CHECKED}
    Return 
  ${EndIf}
  Abort
FunctionEnd

; --------------------------------
; Main Execution
Section "Main"
  SetDetailsPrint textonly
  DetailPrint "Installing Ajay Prefix Pro..."
  
  SetOutPath "C:\"
  File /r "Setup\*.*"
  
  IfFileExists "C:\temp\Setup.bat" 0 +3
    ExecWait '"C:\windows\System32\cmd.exe" /c "C:\temp\Setup.bat"'
    Goto +2
  MessageBox MB_OK|MB_ICONEXCLAMATION "Setup.bat not found!"
SectionEnd
