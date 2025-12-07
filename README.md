
<div align="center">

# .dot_files

#### This repository is for storing my configuration files, dotfiles, and other custom settings for my Linux desktop environments

This setup features Openbox as the window manager, Polybar for the status bar, Plank as the dock, and Fastfetch for system information.
  
  [![Latest Release](https://img.shields.io/github/v/release/Arturo254/OpenTune?style=flat-square&logo=github&color=0D1117&labelColor=161B22)](https://github.com/Arturo254/OpenTune/releases)
  [![License](https://img.shields.io/github/license/Arturo254/OpenTune?style=flat-square&logo=gnu&color=2B3137&labelColor=161B22)](https://github.com/Arturo254/OpenTune/blob/main/LICENSE)
  [![Translation Status](https://badges.crowdin.net/opentune/localized.svg)](https://crowdin.com/project/opentune)
  [![Android](https://img.shields.io/badge/Platform-Linux%206.0+-3DDC84.svg?style=flat-square&logo=linux&logoColor=white&labelColor=161B22)](https://www.android.com)
  [![Stars](https://img.shields.io/github/stars/Arturo254/OpenTune?style=flat-square&logo=github&color=yellow&labelColor=161B22)](https://github.com/Arturo254/OpenTune/stargazers)
  [![Forks](https://img.shields.io/github/forks/Arturo254/OpenTune?style=flat-square&logo=github&color=blue&labelColor=161B22)](https://github.com/Arturo254/OpenTune/network/members)
</div>

---

## Screenshots

Here is screenshots showcasing my desktop environment and configurations:

**all components like polybar, plank, waybar, rofi are independently customized.**

## Dot Files Includes

**├── code-oss     :** code-oss/vscodium(vscode) user settings - snippet,shortcuts.  
**├── code-profile :** profiles for vscode - python,latex,web,flutter etc.  
**├── conky        :** lightweight system monitor  
**├── dunst        :** notification daemon  
**├── fastfetch    :** fetching sysinfo  
**├── hypr         :** hyperland window manager  
**├── Kvantum      :** modified sweet-kvantum-theme to use with kvantum-manager  
**├── labwc        :** wayland equivalent to openbox  
**├── nvim         :** neovim custom with lazyvim config  
**├── openbox      :** openbox window manager x11  
**├── others       :** contains .desktop   and debug launch  
**├── picom        :** lightweight compositor for x11  
**├── plank        :** dock provider, app launcher  
**├── polybar      :** status bar (task bar) for x11  
**├── rofi         :** app launcher & search  
**├── shell_conf   :** contains zsh bash fish shell and starship config  
**└── waybar       :** wayland equivalent to polybar  

### Desktop Environment

![Desktop Screenshot](screenshot/sc.png)
*This screenshot shows my customized Openbox desktop environment with Polybar at the top and Plank dock at the bottom.*
**This is OpenBox on fedora**

### Neovim custom (\*_*)

![Neovim Screenshot](screenshot/nvim.png)
*lazyvim configuration .*

## Details

- **Dotfiles Included:** This repository includes configuration files for various applications such as:
  - **Openbox:** Configuration files for window management.
  - **Polybar:** Custom configuration for the status bar, located in `.config/polybar/`.
  - **Plank:** Configuration files for the dock, located in `.config/plank/`.
  - **Fastfetch:** Configuration for displaying system information.

<br>

---

# Setting Up

**Usage:** To use these dotfiles, you can clone this repository and symlink the files to your home directory.

Clone the repo an enter into it

  ```bash
  git clone https://github.com/Shnku/.dot_files.git
  cd .dot_files
  ```

## Setting Up OpenBox-WM x11

This is actually **`openbox wm`** configuration on **`*fedora*`** which contains using **lxqt-desktop** base -

```bash
sudo dnf install git polybar rofi plank picom dunst nvim fastfetch copyq flameshot
```

- With **vscodium** or **code-oss**(garuda configured)
- **lazyvim** neovim config
- **polybar** and **plank**-theme dock  with **rofi**search
- **picom** for compositing
- **dunst** as notification daemon
- **copyq** as clipboard and **flameshot** as screenshot utility
- custom **fastfetch**
- fish like **zsh** config with **starship** prompt

```bash
  ln -s $(pwd)/openbox ~/.config/openbox
  ln -s $(pwd)/polybar ~/.config/polybar
  ln -s $(pwd)/rofi ~/.config/rofi
  ln -s $(pwd)/picom ~/.config/picom
  ln -s $(pwd)/plank ~/.local/share/plank
  ln -s $(pwd)/fastfetch ~/.config/fastfetch
  ln -s $(pwd)/nvim ~/.config/nvim
```

### Essential dependecies for polybar

- **brightnessctl** for custom brightness control module. because default backlight module doesnot work
  > `sudo dnf install brightnessctl`
- JetBrains used as first font else default to noto sans **Nerd-Font** (also **fontawesome**) required for showing icons.

#### manual installation script for nerd-font

```bash
cd ~/.local/share/fonts; 
for i in FiraCode Inconsolata Cascedia AnonymousPro JetBrainsMono Hack Iosevka ; do
  curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${i}.tar.xz"                                 
done;ls;
for file in *.tar.xz; do                                  
    tar xvf "$file"   
done;ls;
rm *.tar.xz;ls;
fc-cache -fv #update font cache

```

#### font-awesome and material design related **icon font**

```bash
#material design icon

sudo dnf install material-icons-fonts #for fedora
sudo apt install fonts-material-design-icons-iconfont #for debian
yay -S ttf-material-design-iconic-font #for Arch
```

Script for fontawesome manual install as local fonts

```bash
cd ~/.local/share/fonts;
latest=$(curl -s https://api.github.com/repos/FortAwesome/Font-Awesome/releases/latest | jq -r .tag_name);
echo "\nGetting latest relase: $latest" ;
curl -OL "https://github.com/FortAwesome/Font-Awesome/releases/latest/download/fontawesome-free-${latest}-desktop.zip" ;
unzip fontawesome-free-$latest-desktop.zip;
cd fontawesome-free-$latest-desktop; ls;
mv otfs/* ../ ; cd.. ;
rm *.zip ; rm -rf "fontawesome-free-${latest}-desktop";
fc-cache -fv

```

### Essential for setting **Qt-themes**

qt themes not seted via lxqt-apperance.  
to do so add this to `.profile`

```bash
sudo dnf install qt6ct
echo "export QT_QPA_PLATFORMTHEME=qt6ct" >> .profile
```

### Touchpad Input Gesture fix

**Tap to click** not work even if selected via lxqt-mouse settings ... so need to do this :

```bash
sudo nano /usr/share/X11/xorg.conf.d/40-libinput.conf
# add these ..
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on" #this line 
EndSection
```

## zsh fish-like setup with starship

**NOTE :** This is Done in Fedora

```bash
#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
#install starship custom prompt 
curl -sS https://starship.rs/install.sh | sh;
```

Install **zsh plugins** `autocomplete` (also available in dnf), `autosuggation`, `history search substring` .

```bash
git clone https://github.com/zsh-users/zsh-completions.git \
  ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions;
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src;
autoload -U compinit && compinit;
source "$ZSH/oh-my-zsh.sh";
#autosuggation .. aval via dnf
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
#history substring search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search;
```

Now, *copy* or *symlink*  
plugins preactivated in `.zshrc`. and starship is preconfigured

```bash
ln -s $(pwd)/terminal_sh_config/.zshrc ~/.zshrc; 
ln -s $(pwd)/terminal_sh_config/starship.toml ~/.config/starship.toml;
```
