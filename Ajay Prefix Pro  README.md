# Ajay Prefix Pro v1.4

## Executive Overview
Ajay Prefix Pro v1.4 is a specialized utility designed for registry redirection and environment management. The tool is distributed in both **Archive** and **Installer (EXE)** formats. To initiate deployment, execute the installer or extract the archive and run `setup.bat`.

## Security & VirusTotal Transparency
Due to the nature of registry manipulation and script execution, certain heuristic engines may trigger **false positives**. You can review the [VirusTotal Analysis here](https://www.virustotal.com/gui/file/44fcacd127296f8a0acebf1040e2420e19e078b56dbbbca042b2f12d545c9a11/detection).

* **Why flags occur:** High-level script execution during extraction often mimics suspicious behavior to automated scanners.
* **Verification:** The application has been rigorously tested in isolated Windows environments. No malicious telemetry or unauthorized activity was detected; the tool performs only its intended registry redirection.

## Open Source Audit & Code Review
For full transparency, we encourage users to audit the logic before execution:
1.  **Extract:** Use a standard archive manager (WinRAR, 7-Zip).
2.  **Inspect:** Open the core components (`Run.au3`, `Setup.ajau3`, or `Setup_main.bat`) in any text editor to verify the source code.

## Usage & Requirements
* **Deployment:** Extract the archive and run `setup.bat`. This unpacks `setup.7z` to the `C:\` drive and launches `Setup_main.bat`.
* **Privileges:** **Administrative Rights** are strictly required to authorize registry modifications.
* **Compatibility:** Now officially supports **Linux via Wine**. Extensive testing has been performed using the **Bottles** app on Fedora.

---

## 🛠 For Contributors & Developers
If you are submitting a **Pull Request** or contributing to the core logic, you may need to access protected assets within the Start Menu archives.

* **Archive Access:** Passwords for the Start Menu archives are embedded within the project scripts. 
* **Support:** If you are a contributor and cannot locate the credentials within the script logic, please contact the **Lead Developer** directly for access.

---

## Contact & Support
Encountered a bug or a persistent false positive? 
* **Issues:** Open a ticket on this GitHub repository.
* **Feedback:** We actively use community feedback to refine our code and reduce antivirus flagging in future releases.

**Thank you for choosing Ajay Prefix Pro!**
