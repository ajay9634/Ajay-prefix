# Ajay Prefix Pro v1.2 - README

## Overview
Ajay Prefix Pro v1.2 is distributed in archive format. Extract the archive and run `setup.bat` to begin installation.

## VirusTotal Flags
If you encounter flags on VirusTotal (https://www.virustotal.com/gui/file/f8c6422a732481205bb3da6df4741ced4fa6b5f24e2180b6d498278d95be05a4), please note the following:

- These flags are **false positives**, primarily triggered by the scripts' execution during the extraction process.
- The application has been tested on a Windows PC, and no malicious activity was observed. The intended registry redirection functioned as expected.

## Reviewing the Scripts
To ensure transparency, all scripts within the archive are accessible for review or verification. Follow these steps:

1. **Install an Archive Tool**: Ensure WinRAR or a similar archive tool is installed on your Windows PC or Wine environment.
2. **Open the Archive**: Right-click the archive and select **Extract** using your archive tool.
3. **Extract and Review**: Access the archive contents. Open the scripts (e.g., `Run.au3`, `Setup.ajau3`, `Setup_main.bat`) with Notepad or any text editor to inspect the code.
   - **Run.au3**: Manages 64-bit `cmd.exe` execution for registry updates.
   - **Setup.ajau3**: Provides a GUI for folder selection, saving paths to a configuration file.
   - **Setup_main.bat**: Orchestrates the setup process, including registry modifications and backups.

## Usage Instructions
- **Extraction**: Extract the archive to any folder. The `setup.bat` file extracts `setup.7z` to the C: drive and runs `Setup_main.bat` with administrator privileges.
- **Requirements**: Administrative rights are required for registry changes. Ensure AutoIt is installed if running `.au3` files directly.
- **Note**: Some antivirus software may flag the application due to its design. These are false positives—proceed only if you trust the source.

## Contact and Support
For questions or to report issues, please open an issue on this GitHub repository or contact the author. Feedback on false positives is welcome to improve future releases.

Thank you for using Ajay Prefix Pro!3. **Extract and Review**: Use Archive Tool to access the archive contents. Open the scripts (e.g., `Run.au3`, `Setup.ajau3`, `Setup_main.bat`) with Notepad or any text editor to inspect the code.
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
