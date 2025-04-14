![logo](https://github.com/ajay9634/Ajay-prefix/blob/main/.github/logo.jpg)
---
## 💥 Ajay-prefix

You can install Ajay Prefix in mobox wow64 , winlator , dark os , micewine , latest hangover , gamehub or gamefusion and other wow64 pc emu.

_Note- It's not supported in x86 emu like Exagear, mobox box86 etc.
Exagear mod Ajay has it's own Ajay prefix which can save game data to Ajay prefix_

## ✨ What is Ajay prefix?

[Ajay prefix = game save location to d drive/Ajay_prefix/save_data + Start menu + bug fix]

It has multiple fixes which are needed in many Games.

_Note - If it breaks anything, let me know in issues_

Ajay prefix wiki - [click here](https://github.com/ajay9634/Ajay-prefix/wiki)

## ✨ Installation of Ajay prefix

- **Partial Automatic installation:** 

  Run Ajay prefix.exe from any location. Then install bat from drive D/Ajay_prefix/

 - **Manually installation:**

  Open Ajay prefix.exe as archive  and extract to drive D then run    "Install_prefix_for_current_container.bat"
  
  ( Note : You can install only start menu by manually installation. Game save data location won't change after this )

- Installation guide video -
[![Ajay Prefix Installation Video](https://img.youtube.com/vi/NXCquIv8D4c/0.jpg)](https://www.youtube.com/watch?v=NXCquIv8D4c)

## ✨ Tricky installation

Some Emu may prevent changes in system.reg and user.reg like winlator bionic container etc , It install fine on normal container.

Here are some methods to install Ajay prefix registry in current container.

### For Winlator bionic container

- Download home.zip from [here](https://github.com/ajay9634/Ajay-prefix/raw/refs/heads/Pre-installed-Ajay-prefix/Files/Winlator-bionic/home.7z) , Extract it then copy home folder to drive Z by wfm , Restart the bionic container then check ajay prefix status. Now you can install Ajay Prefix start menu.

## ⚠️ Move game save data to Ajay prefix

If you were playing games before installing the Ajay prefix then you need to move game save from drive C/users/... to drive D/Ajay_prefix/save_data/users/...

## ⚠️ Synchronisation of Ajay prefix save data in different Container or Emulator

You need to set drive D location in the same folder otherwise copy save data manually.

## 🔗 Link of Ajay prefix v10.16

Ajay prefix is available in this Release section.

[Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Ajay_prefix)

## ✨ Features of Ajay prefix -

- Save game location to d drive/Ajay_prefix/save_data , you can uninstall emu without any worry but remember some games save game to game folder or different location. you need to backup that save manually.
-  Most necessary files like different wined3d, dxvk , vkd3d , vc redist ,physx ,openal and many more
- Custom wined3d install feature and other necessary features
- Dosbox emu fast version, Adobe flash player ,media player classic old version and some video codecs and many more
- Xaudio, Faudio and some other dsound dlls
- Custom mono gecko and net framework installation option from the start menu
- Resources files protection from the virus

## ✨ Some special features help
- Read help.txt from relative folder

## 🛡️ Safe ?
- It's definitely safe, I scanned all files before adding to Ajay prefix.
I got these files from trusted source so don't worry, Don't install it if you have trust issues.

## ⚠️ limit

- It may break container in some other emu.
- It may break some games.
- It don't backup Steam games save data which are present in "C:/Program Files (x86)/Steam/"
- It change Game save path  only "C:/users/" to "D:/Ajay_prefix/save_data/users"
- If some Games are still using "C:/users/" then try "backup and restore drive C users" feature.

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

### ✅ Steam Patch and online Steam installer with Fonts fixed

- Tested in winlator glibc cmod

  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Steam_Patch)

### ✅ Box64 wcp for winlator glibc

   [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Box64_wcp)

### ✅ d3d wcp Files collection for winlator glibc
  
  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/D3d_wcp)

### ✅ Turnip Zink virgl wcp collection for winlator glibc

  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Graphics_driver)

### ✅ Turnip zink virgl exe collection for all winlator
  
  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/graphics_driver_exe)

### ✅ wine wcp for winlator glibc

  [Link](https://github.com/ajay9634/Ajay-prefix/releases/tag/Wine_wcp)

## ⚠️ _Note_

- I don't compile turnip zink virgl or wine, I add wcp from existing source.

 - Other help (discord group)
  you can ask help in Emuplay0 discord

  [Emuplay0 discord](https://discord.gg/XpbEp3dWv3)

## 💲 _Support me_
You can support me by subscribing my youtube channel and watching the videos.
[My YT channel](https://youtube.com/@EMUPLAY0?si=TA9tOZx49eZa4OuN)

========================================

### Main developer of Ajay prefix

- ajay9634 (Emuplay0)

### Third party Credits -

- files from winlator 
- files from mobox
- files from dxvk GitHub
- files from wined3d for windows
- files from Microsoft
- files from third party open source
- sfx by winrar 420
- 7z
- WineHQ
- Emuplay0 testing teamteam
- guide by Chatgpt

========================================




