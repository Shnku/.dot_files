
<div align="center">

# .dot_files

This repository is for storing my configuration files, dotfiles, and other custom settings for my Linux desktop environments.  
**My current setup features [Openbox](https://en.wikipedia.org/wiki/Openbox) Window Manager on [BOSS ***(Bharat Operating System Solutions)*** GNU/Linux](https://bosslinux.in/).** But you can setup each component manually. Checkout the [Set-Up guide](#setting-up)

[![License](https://img.shields.io/github/license/Shnku/.dot_files?style=flat-square&logo=gnu&color=2B3137&labelColor=161B22)](https://github.com/Shnku/.dot_files/blob/main/LICENSE)
![Android](https://img.shields.io/badge/Platform-Linux%206.0+-3DDC84.svg?style=flat-square&logo=linux&logoColor=white&labelColor=161B22)

## Dot Files Includes

</div>

**├── Kvantum      :** modified sweet-kvantum-theme to use with kvantum-manager  
**├── code-oss     :** code-oss/vscodium(vscode) user settings - snippet,shortcuts.  
**├── code-profile :** profiles for vscode - python,latex,web,flutter etc.  
**├── conky        :** lightweight system monitor  
**├── dunst        :** notification daemon  
**├── fastfetch    :** fetching sysinfo  
**├── hypr         :** hyperland window manager  
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

<div align="center">

## Screenshots

Here is screenshots showcasing my desktop environment and configurations:  

# Setting Up

</div>

To use these dotfiles, clone this repo & Copy or Symlinks the configes to desire locations (mainly at `~/.config`).
**All components like polybar, plank, waybar, rofi are independently customized.**  
Though this setup is Openbox focused. But all of my configs are included here like `hyperland` `labwc` wayland. You can pick config files individually and combine them.

```bash
git clone https://github.com/Shnku/.dot_files.git
cd .dot_files
```

## Openbox Setup

Openbox-session is configured with lxde/lxqt desktop base. Also possible with other distros- fedora(it was my previous setup), debian, arch. Just packages names may varies.

```bash
git polybar rofi plank picom dunst fastfetch copyq flameshot conky brightnessctl

#this packages are must install with apt/dnf/pacman/yay
```

- **`polybar`** as statusbar (panel/top-bar) and **`plank`** dock  with **`rofi`** search
- **`picom`** for compositing
- **`dunst`** as notification daemon
- **`copyq`** as clipboard
- **`flameshot`** as screenshot utility
- **`conky`** as desktop system moniter

For general apps recommendations...

- `qimgv` as image viewer
- `qpdfview` as pdf viewer
- `kdeconnect` for mobile syncing and sharing.

> [!IMPORTANT]
> `brightnessctl` is required for polybar to change the brightness in laptop.

For theming,  
`lxapperance qt5ct qt6ct`

**Do symlink** or do copy the configes to desire locations (mainly at `~/.config`).

```bash
ln -s .dot_files/openbox ~/.config/openbox;
ln -s .dot_files/polybar ~/.config/polybar;
ln -s .dot_files/rofi ~/.config/rofi;
ln -s .dot_files/picom ~/.config/picom;
ln -s .dot_files/plank ~/.local/share/plank/themes/plank; # note
ln -s .dot_files/fastfetch ~/.config/fastfetch;
ln -s .dot_files/conky ~/.config/conky;
```

## Individual Set-ups

### Setting up Fonts (Nerd-fonts, icon fonts)

> [!IMPORTANT]
> JetBrains used as first font else default to noto sans.
> **Nerd-Font** (also **fontawesome**) required for showing icons.  

**Manual installation script for nerd-font**

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

**font-awesome and material design related ***icon font*****

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

### zsh fish-like setup with starship

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

### Essential for setting **Qt-themes**

qt themes can't be sated via lxapperance.  
to do so add this to `~/.profile`

```bash
# Choose accordingly qt6ct/qt5ct to use. 
echo "export QT_QPA_PLATFORMTHEME=qt6ct" >> ~/.profile
```

> [!NOTE]  
> openbox session stores environment variables at `.config/openbox/environment`  
> Need to change there. This maybe same for other desktop-sessions.

### Touchpad Input Gesture fix

**Tap to click** not work even if selected via lxqt-mouse settings ... so need to do this :

```bash
sudo nano /usr/share/X11/xorg.conf.d/40-libinput.conf
# add these ..
```

```bash
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on" #this line 
EndSection
```
