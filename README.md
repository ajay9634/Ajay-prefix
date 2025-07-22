![logo](https://github.com/ajay9634/Ajay-prefix/blob/main/.github/logo.jpg)

---

## 💥 Ajay-prefix

You can install the Ajay Prefix on various PC emulators such as MoboX WOW64, Winlator, Dark OS, MiceWine, the latest Hangover, GameHub, GameFusion, and other WOW64 PC emulators.

> ⚠️ **Note:** Not supported on x86 emulators like ExaGear or Mobox Box86.  
> ExaGear Mod Ajay has a separate Ajay Prefix setup.

---

## ❓ What is Ajay Prefix?

✨ **Ajay Prefix v10.19**  

📌 `Ajay prefix = game save location to any drive:\Ajay_prefix\save_data + Start menu customization + bug fixes`

Includes multiple fixes needed in many games.  
📝 *Note: If it causes any issues, please let me know in the issues section.*

📖 [Ajay prefix v10.19 wiki – click here](https://github.com/ajay9634/Ajay-prefix/wiki)

---

## 📦 [Download Ajay Prefix v10.19](https://github.com/ajay9634/Ajay-prefix/releases/tag/Ajay_prefix)

---

## ⚙️ Installation of Ajay Prefix v10.19

### 🔹 Partial Automatic Installation (User Interface):

1. ▶️ Run `Ajay_prefix.exe` from any location.  
2. 💽 Select your desired installation drive (e.g., `D:` or `F:`).  
3. 📂 Navigate to `selected_drive:\Ajay_prefix\`  
4. ✅ Execute the `.bat` file to complete the installation.

---

### 🔹 Manual Installation (Fully Compatible):

💡 *Use this if your emulator doesn't support automatic installation.*

1. 📦 Open `Ajay_prefix.exe` as archive via ZArchiver or rename to `.zip`.  
2. 📂 Extract `Ajay_prefix` folder to desired drive (e.g., `D:\`, not in subfolders).  
3. Navigate to `selected_drive:\Ajay_prefix\`  
4. ▶️ Run the `.bat` file to complete install.

📎 **Note:** 
Don't select any internal Drive like C , E , Z etc.

Running `Install_Only_Start_Menu.bat` only modifies the Start menu — game save path remains unchanged.

---

### 🎥 Video Guides

- ▶️ [Ajay Prefix 10.19 Installation Video](https://youtu.be/MYljgF1UObE?si=6LoZ98lbw5dnH3qV)  
- ▶️ [Ajay Prefix 10.18 Final – Manual Installation & Start Menu Explained](https://youtu.be/GLiZUHEPQNc)

---

## 💾 Move Game Save Data to Ajay Prefix

If you previously played games, move your save data from:  
📁 `C:\Users\...` → 📁 `selected drive:\Ajay_prefix\save_data\users\...`

---

## 🔁 Synchronize Save Data Across Containers

To sync save data across containers/emulators:  

- ➡️ Make sure all use the same drive path — or copy manually if needed.

- ➡️ Use `Backup and Restore Drive C Users and ProgramData` feature

---

## ✨ Features of Ajay Prefix v10.19

- 💾 **Game Save Redirection**  
- 🧰 **Essential Runtime Files Included**  
- 🛠️ **Custom Wined3D & Useful Tweaks**  
- 🧩 **Bundled Tools (DOSBox, Flash, MPC, Codecs)**  
- 🔊 **Audio Libraries (XAudio, FAudio, dsound)**  
- 🌐 **Mono, Gecko, .NET One-Click Setup**  
- 🎮 **Popular Wrappers Included (dgVoodoo, DXWrapper, etc.)**  
- 🧪 **Microsoft Sample Test Tools**  
- 📋 **Experimental Start Menu for Winlator 10+**  
- 🔒 **Resource File Protection**

---

## 🚧 Limitations

- 🌐 Requires Internet for full setup  
- ⚠️ May cause issues on some emulators  
- ❌ Some games may not be compatible  
- 🚫 No backup for Steam saves in `C:\Program Files (x86)\Steam\`  
- 📂 Game save path changed to `selected_drive:\Ajay_prefix\save_data\users`  
- 🔄 Games still using `C:\Users\` → Use `Backup and Restore Drive C Users and ProgramData` feature

---

## 🆘 Some Special Help

📄 Read `help.txt` inside relevant folders.  
📚 [Ajay Prefix Wiki on GitHub](https://github.com/ajay9634/Ajay-prefix/wiki)

---

## 🛡️ Is It Safe?

✅ Yes, everything is scanned and verified.  
⚠️ *If you still have trust issues, please avoid installing it.*

---

## 🧪 Environment Variables

### 🎮 VKD3D FPS HUD
```bash
VK_INSTANCE_LAYERS=VK_LAYER_MESA_overlay
```

### 📈 BOX64 – Performance
```bash
BOX64_DYNAREC_PAUSE=0
BOX64_DYNAREC_WEAKBARRIER=1
BOX64_MAX_CPU=4
BOX64_NOBANNER=1
BOX64_DYNAREC_ALIGNED_ATOMICS=1  # games may crash
BOX64_DYNAREC_DIRTY=1
BOX64_RDTSC_1GHZ=1
```

### 🎯 BOX64 – Fix Source Engine Bugs
```bash
BOX64_DYNAREC_CALLRET=0
BOX64_ALLOWMISSINGLIBS=1
```

### ⚙️ BOX64 – Compatibility
```bash
BOX64_DYNAREC_DIV0=1
BOX64_DYNAREC_TBB=0
BOX64_FIX_64BIT_INODES=1
BOX64_IGNOREINT3=1
BOX64_RESERVE_HIGH=1
BOX64_UNITYPLAYER=1
BOX64_SYNC_ROUNDING=1
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
- Emuplay0 Testing Team
- Winlator, MoBox
- DXVK, Wined3D , vkd3d
- Microsoft, WineHQ
- Open-source projects
- WinRAR, 7z, wget, curl
- Anyburn ,Nvidia , Python , 
- dxwrapper , dgvoodoo , nglide , wrapper by ThirteenAG , d3d8to9 , gldirect , TitaniumGL
- Guide by ChatGPT
---
