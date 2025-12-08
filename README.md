
<div align="center">

# .dot_files

This repository is for storing my configuration files, dotfiles, and other custom settings for my Linux desktop environments.  
**My current setup features [Openbox](https://en.wikipedia.org/wiki/Openbox) Window Manager on [BOSS ***(Bharat Operating System Solutions)*** GNU/Linux](https://bosslinux.in/).** But possible to setup each component manually. Checkout the [Set-Up guide](#setting-up)

[![License](https://img.shields.io/github/license/Shnku/.dot_files?style=flat-square&logo=gnu&color=2B3137&labelColor=161B22)](https://github.com/Shnku/.dot_files/blob/main/LICENSE)

![made for linux](https://img.shields.io/badge/Made%20for-linux-white?style=for-the-badge&logo=linux)
![built with](https://img.shields.io/badge/Made%20with-love-pink?style=for-the-badge&logo=undertale)  
![debian](https://img.shields.io/badge/Debian-A81D33?style=for-the-badge&logo=debian&logoColor=white)
![fedora](https://img.shields.io/badge/Fedora-294172?style=for-the-badge&logo=fedora&logoColor=white)
![arch](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)

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

Here is the screenshot showcasing my **current** desktop environment and setup:  

![screenshot](/screenshot/2025-12-08_17-29.png)

Other and Old Screeshots
<details>
  <summary>setup on fedora (polybar-colors.old, plank dock , fastfetch)</summary>

  ![old on fedora](/screenshot/sc.png)
  old setup (polybar different color)
  ![first config-old](/screenshot/2024-12-24_20-27.png)
</details>

<details>
  <summary>boss linux cinnamon conky setup (`/conky/boss_linux_conky.conf`)</summary>
  
  ![boss](/screenshot/Screenshot%20from%202025-12-03%2020-12-23.png)
  ![boss](/screenshot/Screenshot%20from%202025-12-03%2016-10-25.png)
</details>

<details>
  <summary>neovim on qterminal fedora (lazyvim)</summary>
  
  ![boss](/screenshot/nvim.png)
</details>

<details>
  <summary>hyperland setup on garuda linux (waybar)</summary>
  
  ![boss](/screenshot/2024-04-28T20_11_10,022624030+05_30_082331.png)
</details>
<br>

---

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
# this packages are must; 
git polybar openbox rofi plank picom dunst fastfetch copyq  conky brightnessctl 
# general purpose;
qterminal lxpolkit lxqt-powermanagement pcmanfm obconf flameshot exa bat zsh nitrogen

# install them with apt/dnf/pacman/yay
```

- **`polybar`** as statusbar (panel/top-bar) and **`plank`** dock  with **`rofi`** search
- **`picom`** for compositing
- **`dunst`** as notification daemon
- **`copyq`** as clipboard
- **`conky`** as desktop system moniter

For needed apps *(this apps are mentioned in config, if other alternative used, needs to change them accordingly)*...

- `lxpolkit` used as policykt agent (it provides root passwd prompt).
- `qterminal` as default terminal
- `exa` and `bat` as alternate to `ls` and `cat` command
- `zsh` as default POSH shell
- `lxqt-powermanagement` (default in lxde/lxqt) or `xfce4-power-manager` can be use in case of laptop.
- `nitrogen` for wallpaper changing utility

Other general recommendations for full fludge desktop experience ..  

- `flameshot` as screenshot utility
- `qimgv` as image viewer
- `qpdfview` as pdf viewer supports tabs
- `qalculate` as calculator provider
- `kdeconnect` for mobile syncing and sharing.

> [!IMPORTANT]
> `brightnessctl` is required for **polybar** to change the brightness in laptop.  
> **Nerd font** required also.  

For theming, (newer system uses qt6 generally)  
`lxapperance qt5ct qt6ct qt5-style-kvantum qt5-gtk-platformtheme kvantum-qt5`  

```bash
# Get openbox themes from these links.
git clone https://github.com/reorr/my-theme-collection.git;
mv -v my-theme-collection/* ~/.themes/;
git clone https://github.com/addy-dclxvi/openbox-theme-collections.git;
mv -v openbox-theme-collections/* ~/.themes/

# gtk theme
git clone https://github.com/addy-dclxvi/gtk-theme-collections.git;
mv -v gtk-theme-collections/* ~/.local/share/themes/
```

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

**font-awesome and material design related *icon font***

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

---

### zsh fish-like setup with starship

```bash
#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
#install starship custom prompt 
curl -sS https://starship.rs/install.sh | sh;
```

Install **zsh plugins** `autocomplete` (some available in dnf,apt, all in arch repo), `autosuggation`,`zsh-syntax-highlighting`, `history search substring` .

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
ln -s $(pwd)/shell_conf/.zshrc ~/.zshrc; 
ln -s $(pwd)/shell_conf/starship.toml ~/.config/starship.toml;
```

> [!NOTE]  
> starship and fish, bash is configured on garuda linux(Arch).
> also in .rc files config aliases are may varies on system-wise

---

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

---

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
