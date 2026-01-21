#! /usr/bin/env bash

sudo apt update
sudo apt upgrade -y

# install packages
sudo apt install -y xorg neovim vim git build-essential libx11-dev libxft-dev libxinerama-dev libxcb1-dev libxcb-res0-dev libx11-xcb-dev libxcb-util-dev libxrandr-dev network-manager picom feh arandr pipewire pulseaudio unzip flatpak ntfs-3g wireplumber bluez playerctl brightnessctl tmux rfkill pass gnupg2 clang clang-tools nodejs npm python3-venv python3-pip python-is-python3 ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick pinentry-gtk2 pinentry-tty lua5.1 luarocks adwaita-icon-theme adwaita-icon-theme-legacy breeze-icon-theme lxappearance qt5ct qalc xclip libavcodec-extra breeze gnome-themes-extra btop firefox-esr pcmanfm keepassxc mpv qimgv lazygit gpick darktable copyq flameshot unclutter-xfixes pulsemixer syncthing dunst yt-dlp gallery-dl qbittorrent qalculate-qt okular calcurse libreoffice libreoffice-gtk3 ark krename valgrind mkvtoolnix mkvtoolnix-gui bear dolphin udisks2 kde-cli-tools polkit-kde-agent-1 stow

# i think doing this in the previous command causes conflicts
sudo apt install -y pipewire-audio-client-libraries

# install ueberzugpp (debian 13)
echo 'deb http://download.opensuse.org/repositories/home:/justkidding/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/home:justkidding.list
curl -fsSL https://download.opensuse.org/repositories/home:justkidding/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_justkidding.gpg > /dev/null
sudo apt update
sudo apt install -y ueberzugpp

# clone a few repos
sudo mkdir -p ~/{dev,suckless,.fonts,.config,downloads,documents,desktop,music,pictures,videos} /mnt/{hdd,ssd,windows,camera}
git clone https://amitshky@github.com/amitshky/dotfiles ~/dotfiles
git clone https://amitshky@github.com/amitshky/st ~/suckless/st
git clone https://amitshky@github.com/amitshky/dwm ~/suckless/dwm
git clone https://amitshky@github.com/amitshky/dmenu ~/suckless/dmenu
git clone https://amitshky@github.com/amitshky/dwmblocks-async ~/suckless/dwmblocks-async
git clone https://amitshky@github.com/amitshky/slock ~/suckless/slock

# install dwm and other suckless tools
cd ~/suckless/dwm
sudo make clean install
cd ../st
sudo make clean install
cd ../dmenu
sudo make clean install
cd ../dwmblocks-async
sudo make clean install
cd ../slock
sudo make clean install
cd ~

# copy configs
cd ~/dotfiles
stow .
cd ~

# install fonts
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o /tmp/JetBrainsMono.zip
mkdir -p ~/.fonts/JetBrainsMono/
unzip /tmp/JetBrainsMono.zip -d ~/.fonts/JetBrainsMono/ 
fc-cache

# install programs from .deb
curl -s "https://api.github.com/repos/git-ecosystem/git-credential-manager/releases/latest" | grep browser_download_url | grep 'gcm-linux_amd64.*\.deb' | cut -d '"' -f 4 | xargs curl -sL -o /tmp/gcm.deb
curl -sL "https://discord.com/api/download?platform=linux&format=deb" -o /tmp/discord.deb
sudo dpkg -i /tmp/gcm.deb /tmp/discord.deb 

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
source "$HOME/.cargo/env"

# install yazi
cargo install --force yazi-build

# add flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install flatpak packages
sudo flatpak install -y app/md.obsidian.Obsidian/x86_64/stable com.protonvpn.ww 

# this just freezes dolphin and other apps when they start so remove them
sudo apt purge xdg-desktop-portal* -y
sudo apt autoremove -y

# enable network manager service
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
