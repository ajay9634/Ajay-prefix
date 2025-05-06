![logo](https://github.com/ajay9634/Ajay-prefix/blob/main/.github/logo.jpg)
---
## 💥 Ajay-prefix

You can install the Ajay Prefix on various pc emu such as MoboX WOW64, Winlator, Dark OS, MiceWine, the latest Hangover, GameHub, GameFusion, and other WOW64 PC emulators.

> **Note:** Not supported on x86 emulators like ExaGear or Mobox Box86. ExaGear Mod Ajay has a separate Ajay Prefix setup.


## ✨ What is Ajay prefix?

✨ What is Ajay Prefix v10.18?

[Ajay prefix = game save location to any drive:\Ajay_prefix\save_data + Start menu customization + bug fixes]

It includes multiple fixes needed in many games.

Note: If it causes any issues, please let me know in the issues section.

Ajay prefix wiki - [click here](https://github.com/ajay9634/Ajay-prefix/wiki)

## ✨ Installation of Ajay prefix v10.18

- ***Partial Automatic Installation (user interface):*** 
  
1. Run `Ajay_prefix.exe` from any location.
2. Select your desired installation drive (e.g., D: , F:).
3. Navigate to:  
       selected_drive:\Ajay_prefix\
4. Execute the `.bat` file in that folder to complete the installation.

- ***Manual Installation: (compatible)***  
1. Open `Ajay_prefix.exe` as archive.
2. Extract `Ajay_prefix` folder your desired installation drive (e.g., D: , F:). (don't extract it  into any subfolder)
3. Navigate to:  
       selected_drive:\Ajay_prefix\
4. Execute the `.bat` file in that folder to complete the installation.

  **Note:** Running `Install_only_start_menu.bat` will only modify the Start menu, leaving the game save data location unchanged.

- **Ajay prefix v10.18 Installation Guide Video** -  
[![Ajay Prefix Installation Video](https://img.youtube.com/vi/NXCquIv8D4c/0.jpg)](https://youtu.be/yr3tpOhik0Q?si=VHWzmGhFJYA9WgKr)

## ✨ Note - 

Latest winlator bionic unofficial are fixed for Ajay prefix by pissblaster dev. Recommended unofficial fork -  [jhinzuo](https://github.com/jhinzuo/winlator/releases)

## ⚠️ Move Game Save Data to Ajay Prefix

If you were playing games before installing Ajay Prefix, you need to manually move your game save data from:

`C:\Users\...`

to:

`selected drive:\Ajay_prefix\save_data\users\...`

## ⚠️ Synchronization of Ajay Prefix Save Data Across Different Containers or Emulators

To keep your save data in sync, make sure that the `selected drive:` location is set to the same folder across all containers or emulators.  
If that's not possible, you'll need to manually copy the save data between them.

## 🔗 Link to Ajay Prefix v10.18

Ajay Prefix is available in the Releases section.

[Download Ajay Prefix v10.18](https://github.com/ajay9634/Ajay-prefix/releases/tag/Ajay_prefix)

## ✨ Features of Ajay Prefix v10.18

- **Save Game Location to selected Drive:**  
  Automatically redirects game saves to `selected drive:\Ajay_prefix\save_data`. You can uninstall the emulator without losing your progress.  
  *(Note: Some games may save data in their own folders or other locations — backup manually if needed.)*

- **Essential Runtime Files Included:**  
  Comes bundled with critical components such as multiple versions of `wined3d`, `DXVK`, `VKD3D`, `VC Redist`, `PhysX`, `OpenAL`, and more.

- **Custom Wined3d Installation & Useful Tweaks:**  
  Allows easy installation of custom `wined3d` and includes other practical features to improve compatibility.

- **Bundled Tools & Components:**  
  Includes fast DOSBox emulator, Adobe Flash Player, an older version of Media Player Classic, various video codecs, and more.

- **Audio Support Libraries:**  
  Pre-includes `XAudio`, `FAudio`, and various `dsound` DLLs for better sound compatibility.

- **Mono, Gecko & .NET Framework Support:**  
  Install Mono, Gecko, and .NET Framework directly from the Start menu with one click.

- **Multiple Game Wrappers Included:**  
  Comes with many popular wrappers like `dgVoodoo`, `DXWrapper`, `TitaniumGL`, wrappers by `ThirteenAG`, `d3d8to9`, and more for enhanced compatibility with older games.

- **Microsoft Sample Test Tools:**  
  Includes official Microsoft samples to test features like DirectX 9/10/11, XInput, DInput, XAudio2, XACT, and more.

- **Experimental Start Menu for Winlator 10+:**  
  Special start menu for Winlator version 10 and above. Allows direct installation of `DXVK`, `Turnip`, `Box64`, and more into container settings in `.tzst` format.

- **Resource File Protection:**  
  Safeguards essential resource files from viruses and unauthorized changes.

## ✨ Some Special Features Help

- Read `help.txt` from the relevant folder for additional guidance and instructions.
- You can also check the [Ajay Prefix Wiki on GitHub](https://github.com/ajay9634/Ajay-prefix/wiki) for detailed documentation and FAQs.

## 🛡️ Is It Safe?

- Yes, it's definitely safe. I have scanned all files before adding them to Ajay Prefix.  
  All files come from trusted sources, so you can be confident in their integrity.  
  **However, if you have trust issues, please refrain from installing it.**
  
## ⚠️ Limitations

- **Internet Required:**  
  An internet connection is needed to download component files and all Start Menu scripts. If the internet is unavailable, only the offline version of the Start Menu will be accessible.

- **Potential Emulator Issues:**  
  It may cause issues or break containers in some other emulators.

- **Possible Game Compatibility Issues:**  
  It may cause certain games to break or not function properly.

- **No Backup for Steam Game Saves:**  
  It does not back up Steam game save data located in `C:\Program Files (x86)\Steam\`.

- **Game Save Path Change:**  
  The game save path is only changed from `C:\Users\` to `selected drive:\Ajay_prefix\save_data\users`.

- **Games Still Using `C:\Users\`:**  
  If some games continue to use the old save path, try using the "Backup and Restore Drive C Users" feature.

---
## ✨ _Necessary Env variables_

#### VKD3D FPS HUD
    VK_INSTANCE_LAYERS=VK_LAYER_MESA_overlay

#### BOX64 Env ( May improve Performance )
   
    BOX64_DYNAREC_PAUSE=0

    BOX64_DYNAREC_WEAKBARRIER=1

    BOX64_MAX_CPU=4
    
    BOX64_NOBANNER=1

    BOX64_DYNAREC_ALIGNED_ATOMICS=1 (games may crash)

    BOX64_DYNAREC_DIRTY=1

    BOX64_RDTSC_1GHZ=1
    
    
#### BOX64 Env ( May fix source engine glitch )

    BOX64_DYNAREC_CALLRET=0 (fix npc rotation bug or aim bug) (If it doesn't work then disable callret from box64 preset)

    BOX64_ALLOWMISSINGLIBS=1


#### BOX64 Env ( May improve compatibility )

    BOX64_DYNAREC_DIV0=1

    BOX64_DYNAREC_TBB=0

    BOX64_FIX_64BIT_INODES=1

    BOX64_IGNOREINT3=1

    BOX64_RESERVE_HIGH=1 (For launchers )

    BOX64_UNITYPLAYER=1 (Fix unity games)

    BOX64_SYNC_ROUNDING=1 (Fix physics, mismatch behaviour, Subtle precion bugs)

    

#### MESA Env ( May improve performance )
    MESA_VK_WSI_DEBUG=(sw

    MESA_GLTHREAD=true

    vblank_mode=0 (for opengl games) (set 1 to fix tearing)

    ZINK_DESCRIPTOR_POOL=1  

    ZINK_USE_LOW_MEMORY_POOL=1


## ✨ _Necessary Stuff_

### ✅ Steam Patch and Online Steam Installer with Fonts Fixed

- Tested in Winlator GLIBC Cmod

  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Steam_Patch)

### ✅ Box64 WCP for Winlator GLIBC

   [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Box64_wcp)

### ✅ d3d WCP Files Collection for Winlator GLIBC

  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/D3d_wcp)

### ✅ Turnip, Zink, Virgl WCP Collection for Winlator GLIBC

  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Graphics_driver)

### ✅ Turnip, Zink, Virgl EXE Collection for All Winlator

  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/graphics_driver_exe)

### ✅ Wine WCP for Winlator GLIBC

  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Wine_wcp)

## ⚠️ Notice

I will prioritize updates for Ajay prefix components with limitations and will not upload any wcp or additional files due to limited support and time. I need to focus on fixing my financial situation through a real job.

## ⚠️ _Note_

- I don't compile Turnip, Zink, Virgl, or Wine. I add WCP from existing sources.

- **Other Help:**  
  You can ask for help in the Emuplay0 Discord group.  
  [![Emuplay0 Discord](https://img.shields.io/badge/Discord-Emuplay0-blue?style=social&logo=discord)](https://discord.gg/XpbEp3dWv3)
  
## 💲 _Support Me_

You can support me by subscribing to my YouTube channel and watching the videos, or donating on my Ko-fi.

[![Subscribe on YouTube](https://img.shields.io/badge/YouTube-Subscribe-red?style=social&logo=youtube)](https://youtube.com/@EMUPLAY0?si=TA9tOZx49eZa4OuN)  
[![Donate on Ko-fi](https://img.shields.io/badge/Donate-Ko_fi-orange?style=social&logo=ko-fi)](https://ko-fi.com)

========================================

### Main Developer of Ajay Prefix

- **ajay9634 (Emuplay0)**

### Third-Party Credits

- Files from Winlator
- Files from MoBox
- Files from DXVK GitHub
- Files from Wined3D for Windows
- Files from Microsoft
- Files from third-party open-source projects
- SFX by WinRAR 420
- 7z
- wget
- curl
- WineHQ
- Emuplay0 Testing Team
- Guide by ChatGPT

========================================
