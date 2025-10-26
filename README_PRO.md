![logo](https://github.com/ajay9634/Ajay-prefix/blob/main/.github/logo.jpg)

---

## ⚡ Ajay-prefix-pro

![Typing SVG](https://readme-typing-svg.herokuapp.com?size=45&duration=6000&pause=3000&color=36BCF7&center=true&vCenter=true&width=1200&height=200&lines=Welcome+to+Ajay+Prefix+pro;Universal+Wine+Tools+and+fixes;Game+tweaks+%7C+Save+redirection+%7C+Start+menu)

You can install the Ajay Prefix on various PC emulators such as MoboX WOW64, Winlator, Dark OS, MiceWine, the latest Hangover, GameHub, GameFusion, and other WOW64 PC emulators. It supports windows 11 too.

## ✨ Requirements

- 64-bit architecture
- Internet connection for the latest Start Menu
- Any Wine-based PC emulator or Windows 11 (24H2 update)
- Administrative permissions for Windows 11

---

![Typing SVG](https://readme-typing-svg.herokuapp.com?size=60&pause=2000&color=F76D36&center=true&vCenter=true&width=1000&height=150&lines=✨+What+is+Ajay+Prefix+pro✨)

✅ **Ajay Prefix Pro v1.2**  

📂 `Ajay prefix = game save location to any drive or folder:\Ajay_prefix\save_data + Start menu customization + bug fixes`

Includes multiple fixes needed in many games.  
📝 *Note: If it causes any issues, please let me know in the issues section.*

---

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=45&duration=5000&pause=3000&color=36BCF7&center=true&vCenter=true&width=1000&lines=📥+Download+Ajay+Prefix+v1.2)](https://github.com/ajay9634/Ajay-prefix/releases/tag/Ajay_Prefix_Pro)

---

## ⚙️ Installation of Ajay Prefix Pro v1.2

### 🛠️ Manual Installation :

1. 📦 Open `Ajay prefix Pro 1.2` as archive via ZArchiver or other tool.  
2. 📂 Run **Setup (Run as Admin).bat**.
3. 🗂️ Select an **Offline Cache Folder** for online components (any folder, subfolder, or root drive).
4. 🗂️ Choose  **Save Data Folder** for game saves (any folder, subfolder, or root drive
5. 🗂️ Click **Save Paths** in the Folder Selector, then **Exit**.
6. 🗂️ If successful, the latest Start Menu will be installed.
7. 🗂️ Restart Windows or your Wine environment
8. 🗂️ Verify Ajay Prefix Pro status in the viewer.


⚠️ **Note:**  
Don't select any internal Drive like C , E , Z etc.  

---

### 📺 Video Guides

---

## 📂 Move Game Save Data to Ajay Prefix Pro

If you previously played games, move your save data from:  
💾 `C:\Users\...` ➝ 💾 `selected drive or folder:\Ajay_prefix\save_data\users\...`

---

## 🔗 Synchronize Save Data Across Containers

To sync save data across containers/emulators:  

- ➡️ Make sure all use the same drive path — or copy manually if needed.  
- ➡️ Use `Backup and Restore Drive C Users and ProgramData` feature  

---

![Typing SVG](https://readme-typing-svg.herokuapp.com?size=60&pause=2000&color=F76D36&center=true&vCenter=true&width=1000&height=150&lines=🚀+Features+of+Ajay+Prefix+🚀)

- 💾 **Game Save Redirection**  
- 📦 **Essential Runtime Files Included**  
- 🎮 **Custom Wined3D & Useful Tweaks**  
- 🖥️ **Bundled Tools (DOSBox, Flash, MPC, Codecs)**  
- 🔊 **Audio Libraries (XAudio, FAudio, dsound)**  
- 🪟 **Mono, Gecko, One-Click Setup**  
- 🎨 **Popular Wrappers Included (dgVoodoo, DXWrapper, etc.)**  
- 🧪 **Microsoft Sample Test Tools**  
- 🏆 **Experimental Start Menu for Winlator 10+**  
- 🔐 **Resource File Protection**

---

![Typing SVG](https://readme-typing-svg.herokuapp.com?size=60&pause=2000&color=F76D36&center=true&vCenter=true&width=1000&height=150&lines=⛔+Limitations)
- 🌐 Requires Internet for full setup  
- ⚠️ May cause issues on some emulators  
- 💡 Some games may not be compatible  
- 🚫 No backup for Steam saves in `C:\Program Files (x86)\Steam\`  
- 📂 Game save path changed to `selected_drive:\Ajay_prefix\save_data\users`  
- 🔧 Games still using `C:\Users\` ➝ Use `Backup and Restore Drive C Users and ProgramData` feature

---

## 📖 Some Special Help

📘 Read `help.txt` inside relevant folders.  
📖 [Ajay Prefix Wiki on GitHub](https://github.com/ajay9634/Ajay-prefix/wiki)

---

## 🔒 Is It Safe?

✅ Yes, everything is scanned and verified.  
⚠️ *If you still have trust issues, please avoid installing it.*

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

## 📁 Necessary Components

### ✅ [Steam Patch & Installer with Fonts](https://github.com/ajay9634/Ajay-prefix/releases/tag/Steam_Patch)  
### ✅ [Box64 WCP for Winlator GLIBC](https://github.com/ajay9634/Ajay-prefix/releases/tag/Box64_wcp)  
### ✅ [D3D WCP Files Collection](https://github.com/ajay9634/Ajay-prefix/releases/tag/D3d_wcp)  
### ✅ [Turnip, Zink, Virgl WCP Collection](https://github.com/ajay9634/Ajay-prefix/releases/tag/Graphics_driver)  
### ✅ [Turnip, Zink, Virgl EXE Collection](https://github.com/ajay9634/Ajay-prefix/releases/tag/graphics_driver_exe)  
### ✅ [Wine WCP for Winlator GLIBC](https://github.com/ajay9634/Ajay-prefix/releases/tag/Wine_wcp)

---

## 🚨 Final Notice

I will focus updates on 1.components of Ajay prefix.
No more WCP uploads due to time and support limits.  

---

## ⚠️ Note

📌 I don’t compile Turnip, Zink, Virgl, or Wine — I use trusted WCP sources.

💬 Need help?  
Join the Emuplay0 Discord group:  
[![Emuplay0 Discord](https://img.shields.io/badge/Discord-Emuplay0-blue?style=social&logo=discord)](https://discord.gg/XpbEp3dWv3)

---

## 💲 Support Me

🙏 Subscribe to my YouTube and watch videos  
☕ Or donate on Ko-fi!

[![YouTube](https://img.shields.io/badge/YouTube-Subscribe-red?style=social&logo=youtube)](https://youtube.com/@EMUPLAY0?si=TA9tOZx49eZa4OuN)  
[![Ko-fi](https://img.shields.io/badge/Donate-Ko_fi-orange?style=social&logo=ko-fi)](https://ko-fi.com)

---

## 👨‍💻 Developer & Credits

👨‍🔧 **Ajay9634 (Emuplay0)**

📦 **Third-Party Sources:**
- Winlator, MoBox
- DXVK, Wined3D
- Microsoft, WineHQ
- Open-source projects
- WinRAR, 7z, wget, curl
- Emuplay0 Testing Team
- Guide by ChatGPT

---
