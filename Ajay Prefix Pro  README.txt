# Ajay Prefix Pro v1.0 - README

## Overview
This application, **Ajay Prefix Pro v1.0**, is a self-extracting archive (SFX) built using WinRAR. It is designed to redirect user registry paths (e.g., Documents folder) on Windows systems, utilizing a 64-bit command-line environment for proper configuration. The tool includes custom scripts to manage this process efficiently.

## VirusTotal Flags
If you encounter flags on VirusTotal (https://www.virustotal.com/gui/file/1d79957eb4f19d710788a7aa9400b45c62f2b65af8c56b78a5278db891e91cbb?nocache=1), please note the following:
- These flags are **false positives**, primarily triggered because the scripts execute from a temporary directory (`C:\Windows\Temp`) due to the SFX extraction process.
- The application has been tested on a Windows PC, and no malicious activity ( The intended registry redirection functioned as expected.
- Specific flags (e.g., "DarkGate AutoIt3.EXE Execution Parameters," "Suspicious Script Execution From Temp Folder") are likely due to sandbox misinterpretation of the SFX stub or WScript usage for user feedback.


## Reviewing the Scripts
To ensure transparency, all scripts within this SFX are accessible for review or verification. Follow these steps:

1. **Install WinRAR**: Ensure WinRAR is installed on your Windows PC or Wine environment.
2. **Open the Archive**: Right-click `AjayPrefixPro_v1.0.exe` and select "Open with WinRAR" (or extract using WinRAR).
3. **Extract and Review**: Use the password `-q` to access the archive contents. Open the scripts (e.g., `Run.au3`, `Setup.ajau3`, `Setup_main.bat`) with Notepad or any text editor to inspect the code.
   - **Run.au3**: Manages 64-bit cmd.exe execution for registry updates.
   - **Setup.ajau3**: Provides a GUI for folder selection, saving paths to a configuration file.
   - **Setup_main.bat**: Orchestrates the setup, including registry modifications and backups.

## Usage Instructions
- **Extraction**: The SFX automatically extracts to `C:\Windows\Temp` and runs `Setup_main.bat`. For manual control, extract to a preferred directory (e.g., `C:\Program Files\Ajay_Scripts`) and run `Setup_main.bat` with administrator privileges.
- **Requirements**: Admin rights are needed for registry changes. Ensure AutoIt is installed if running `.au3` files directly.
- **Note**: Some antivirus software may flag the SFX due to its design. This is a false positive—proceed if you trust the source.

## Contact and Support
For questions or to report issues, please open an issue on this GitHub repository or contact the author. Feedback on false positives is welcome to improve future releases.


Thank you for using Ajay Prefix Pro!
