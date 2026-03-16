# ![logo](https://github.com/ajay9634/Ajay-prefix/blob/main/.github/logo.png)

---

## ⚡ Ajay Prefix Pro

![Typing SVG](https://readme-typing-svg.herokuapp.com?size=45&duration=6000&pause=3000&color=36BCF7&center=true&vCenter=true&width=1200&height=200&lines=Welcome+to+Ajay+Prefix+Pro;Universal+Wine+Tools+and+Fixes;Game+Tweaks+%7C+Save+Redirection+%7C+Start+Menu)

**Ajay Prefix Pro** is a comprehensive utility suite designed for Wine-based environments. It is fully compatible with mobile PC emulators such as Mobox WOW64, Winlator, Dark OS, MiceWine, Hangover, and GameHub (GameFusion). It also provides robust support for native Linux Wine environments (Bottles, Lutris, etc.).

## 📚 Wiki and FAQ
Consult our [Wiki and FAQ](#) for detailed configuration guides, troubleshooting, and advanced tips.

---

## 📋 Requirements

* 🖥️ **Architecture:** 64-bit architecture (includes 32-bit compatibility).
* 🌐 **Internet:** Active connection required for Start Menu components and updates.
* 💻 **Platform:** Any Wine-based PC emulator (Android/ARM).
* 🐧 **Linux:** Native Wine 10+ recommended.

---

![Typing SVG](https://readme-typing-svg.herokuapp.com?size=60&pause=2000&color=F76D36&center=true&vCenter=true&width=1000&height=150&lines=✨+What+is+Ajay+Prefix+Pro✨)

### ✅ Ajay Prefix Pro v1.6

> **Core Functionality:** Game save redirection (`\Ajay_prefix\save_data`) + Start Menu customization + Universal game fixes.
> 
> **Redirected Folders:** `AppData`, `Documents`, and `Saved Games`.

---

## ⚙️ Installation Guide

1.  📦 **Extract:** Unpack `Ajay_Prefix_Pro_v1.6_x64_offline.7z` using ZArchiver or a similar tool.
2.  ⚙️ **Execute:** Run `Install Setup (for wine).bat`.
3.  🔄 **Mode Selection:** Choose `Start Menu Only`, `Prefix Only`, or **Both (Recommended)**. (See *Choice Mode Help* below).
4.  🗂️ **Configure Paths:** Select an **Offline Cache Folder** and a **Save Data Folder**.
5.  💾 **Finalize:** Click **Save and Exit** and wait for the automated script to finish.
6.  🔄 **Restart:** Restart the Wine server/container to apply changes.
7.  ✔️ **Verify:** Check the installation status via the Start Menu Viewer.

---

### 🛠️ Installation Help (Choice Mode)

* **1. Start Menu Only:**
    Choose this if you only want Start Menu dependencies. You **cannot** redirect game save paths, and all prefix-related tools will be unavailable.
* **2. Prefix Only:**
    Choose this for full access to all prefix tools and save redirection. You **cannot** install dependencies in this mode.
* **3. Both (Recommended):**
    The full experience. Provides access to the complete Start Menu, all dependencies, and all prefix tools.

---
> [!IMPORTANT]
> **Manual Registry Backup:** It is highly recommended to export your registry keys before installation. 
> **Save Migration:** After setup, manually move existing saves from `C:\Users\...` to your new designated **Save Data Folder** located at `selected_drive:\Ajay_prefix\save_data\users\...`.

---

## ✨ Key Features

* 💾 **Auto-Backup:** Creates a default registry backup at `C:\AJAY_PREFIX_PRO\Backup\`.
* 🚀 **Performance Tweaks:** Includes WineD3D, DXVK, VKD3D, and specialized registry optimizations.
* 📦 **Essential Runtimes:** Pre-packed with VC Redist (All-in-One), XNA, PhysX, and Disk Tools.
* 🔊 **Audio & Media:** XAudio2_9 Redist, FAudio, and Media Foundation codecs included.
* 🔄 **Ajay Profile Hybridizer:** Dynamically redirects `%UserProfile%` and `%Public%` paths.
* 🛠️ **Integrated Tools:** SymLink tools, Path2Exe, Ajay Hotkeys Pro, and GPU testing suites.

---

## 🔗 Data Synchronization

* **Manual Sync:** Use the **Backup and Restore Tool** to force data migration across different containers.
* **AjayAutoSync:** An automated service that syncs files based on timestamps. *Use with caution as it prioritizes newer file dates over total progress.*
* **Hybridizer:** The preferred method for seamless profile redirection without manual file movement.

---

## ⚠️ Important Notices & Troubleshooting

* 🚫 **Platform Restriction:** Do **NOT** install this on a native Windows OS. This is designed strictly for Wine/Emulators.
* 🚫 **Data Safety:** Deleting your designated **Save Data Folder** will result in permanent loss of game progress.
* 🚫 **System Integrity:** Do not remove files from `C:\AJAY_PREFIX_PRO` or `AjayPrefixConf.txt` in the Windows directory.
* 📂 **Drive Selection:** Avoid using internal drives (Z:, E:, or C:) as the target for the **Save Data Folder**.

---

## ⚙️ Environment Variables

### 🎮 VKD3D FPS HUD
```bash
VK_INSTANCE_LAYERS=VK_LAYER_MESA_overlay
```

### 📈 BOX64 – Performance
```bash
BOX64_DYNAREC_PAUSE=0
BOX64_DYNAREC_WEAKBARRIER=2
BOX64_MAX_CPU=4
BOX64_NOBANNER=1
BOX64_DYNAREC_ALIGNED_ATOMICS=1  # games may crash
BOX64_DYNAREC_DIRTY=1
BOX64_DYNAREC_TBB=1
BOX64_DYNAREC_VOLATILE_METADATA=0 # May generate graphics bugs
```

### 🎯 BOX64 – Fix Source Engine Bugs
```bash
BOX64_DYNAREC_CALLRET=0
BOX64_ALLOWMISSINGLIBS=1
```

### ⚙️ BOX64 – Compatibility
```bash
BOX64_DYNAREC_DIV0=1 # can fix crashes in titles that use tricky math or expect exact CPU fault behavior
BOX64_DYNAREC_TBB=0 # Can fix crashes or instability in JIT-heavy programs (Unity/Unreal)
BOX64_FIX_64BIT_INODES=1 # Fix error "file not found" when the file is there
BOX64_IGNOREINT3=1 # For Some old games, copy protections, or JIT engines misuse INT3
BOX64_RESERVE_HIGH=1 # Fix allocate memory or segfaults when loading big binaries
BOX64_UNITYPLAYER=1
BOX64_SYNC_ROUNDING=1 # Fix crash by Game physics or graphics glitches
BOX64_DYNAREC_X87DOUBLE=1 # Can fix crashes in old DirectX/GL games
BOX64_NOSIGSEGV=1  # May fix game crash
BOX64_RDTSC_1GHZ=1 # May fix too fast and too slow timer in games and fix crash in drm
BOX64_DYNAREC_PAUSE=1 # Can reduce CPU usage and fix crash in multi threaded games
```

### 🧠 MESA Performance
```bash
MESA_VK_WSI_DEBUG=(sw
MESA_GLTHREAD=true
vblank_mode=0   # set to 1 to fix tearing
ZINK_DESCRIPTOR_POOL=1
ZINK_USE_LOW_MEMORY_POOL=1
```
---

## 💲 Support the Project

[![Ko-fi](https://img.shields.io/badge/Donate-Ko_fi-orange?style=social&logo=ko-fi)](https://ko-fi.com)

---

## 👨‍💻 Developer & Credits

👨‍🔧 **Ajay9634 (Emuplay0)**

📦 **Third-Party Sources**:  
- Winlator, MoBox
- DXVK, WineD3D
- Microsoft, WineHQ
- Open-source projects
- WinRAR, 7z, wget, curl
- Emuplay0 Testing Team
- Autoit Software

---
