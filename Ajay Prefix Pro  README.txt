# Ajay Prefix Pro v1.2 - README

## Overview
This App is in Archive format. Just Extract and run setup.bat

## VirusTotal Flags
If you encounter flags on VirusTotal (https://www.virustotal.com/gui/file/1d79957eb4f19d710788a7aa9400b45c62f2b65af8c56b78a5278db891e91cbb?nocache=1), 

please note the following:
- These flags are **false positives**, primarily triggered because the scripts execute due to the SFX extraction process.
- The application has been tested on a Windows PC, and no malicious activity ( The intended registry redirection functioned as expected.

## Reviewing the Scripts
To ensure transparency, all scripts within this SFX are accessible for review or verification. Follow these steps:

1. **Install WinRAR**: Ensure WinRAR is installed on your Windows PC or Wine environment.
2. **Open the Archive**: Right-click on Archive and Extract Using any archive tool.
3. **Extract and Review**: Use Archive Tool to access the archive contents. Open the scripts (e.g., `Run.au3`, `Setup.ajau3`, `Setup_main.bat`) with Notepad or any text editor to inspect the code.
   - **Run.au3**: Manages 64-bit cmd.exe execution for registry updates.
   - **Setup.ajau3**: Provides a GUI for folder selection, saving paths to a configuration file.
   - **Setup_main.bat**: Orchestrates the setup, including registry modifications and backups.

## Usage Instructions
- **Extraction**: The Archive Should be extracted to any folder then the setup.bat extracts setup.7z to Drive C and runs `Setup_main.bat` with administrator privileges.
- **Requirements**: Admin rights are needed for registry changes. Ensure AutoIt is installed if running `.au3` files directly.
- **Note**: Some antivirus software may flag due to its design. This is a false positive—proceed if you trust the source.

## Contact and Support
For questions or to report issues, please open an issue on this GitHub repository or contact the author. Feedback on false positives is welcome to improve future releases.


Thank you for using Ajay Prefix Pro!
