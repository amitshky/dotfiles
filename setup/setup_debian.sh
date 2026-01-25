#! /usr/bin/env bash

PWD=$(pwd)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "backup present sources.list"
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup.$(date +%F)
# WARNING: these sources are specifically for debian 13 (Trixie)
# includes sources for nvidia driver
sudo cp "$SCRIPT_DIR/sources.list" /etc/apt/sources.list

sudo apt-get update
sudo apt-get upgrade -y

echo "install packages"
sudo apt-get install -qq -y xorg neovim vim git build-essential libx11-dev libxft-dev libxinerama-dev libxcb1-dev libxcb-res0-dev libx11-xcb-dev libxcb-util-dev libxrandr-dev network-manager picom feh arandr pipewire pulseaudio unzip flatpak ntfs-3g wireplumber bluez playerctl brightnessctl tmux rfkill pass gnupg2 clang clang-tools nodejs npm python3-venv python3-pip python-is-python3 ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick pinentry-gtk2 pinentry-tty lua5.1 luarocks adwaita-icon-theme adwaita-icon-theme-legacy breeze-icon-theme lxappearance qt5ct qalc xclip libavcodec-extra breeze gnome-themes-extra btop firefox-esr pcmanfm keepassxc mpv qimgv lazygit gpick darktable copyq flameshot unclutter-xfixes pulsemixer syncthing dunst yt-dlp gallery-dl qbittorrent qalculate-qt okular calcurse libreoffice libreoffice-gtk3 xarchiver krename valgrind mkvtoolnix mkvtoolnix-gui bear dolphin udisks2 kde-cli-tools polkit-kde-agent-1 stow cloc

# i think doing this in the previous command causes conflicts
sudo apt-get install -qq -y pipewire-audio-client-libraries

echo "install ueberzugpp (debian 13)"
echo 'deb http://download.opensuse.org/repositories/home:/justkidding/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/home:justkidding.list
curl -fsSL https://download.opensuse.org/repositories/home:justkidding/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_justkidding.gpg > /dev/null
sudo apt-get update
sudo apt-get install -qq -y ueberzugpp

echo "clone a few repos"
mkdir -p $HOME/{dev,dev-not-mine,suckless,.fonts,.config,.local,downloads,documents,desktop,music,pictures,videos}
sudo mkdir /mnt/{hdd,ssd,windows,camera}
git clone https://amitshky@github.com/amitshky/st $HOME/suckless/st
git clone https://amitshky@github.com/amitshky/dwm $HOME/suckless/dwm
git clone https://amitshky@github.com/amitshky/dmenu $HOME/suckless/dmenu
git clone https://amitshky@github.com/amitshky/dwmblocks-async $HOME/suckless/dwmblocks-async
git clone https://amitshky@github.com/amitshky/slock $HOME/suckless/slock

echo "install dwm and other suckless tools"
sudo make -C "$HOME/suckless/dwm" clean install
sudo make -C "$HOME/suckless/st" clean install
sudo make -C "$HOME/suckless/dmenu" clean install
sudo make -C "$HOME/suckless/dwmblocks-async" clean install
sudo make -C "$HOME/suckless/slock" clean install

echo "copy configs"
cd $SCRIPT_DIR/..
stow --adopt .
git restore .
cd $PWD

echo "install fonts"
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o /tmp/JetBrainsMono.zip
mkdir -p $HOME/.fonts/JetBrainsMono/
unzip /tmp/JetBrainsMono.zip -d $HOME/.fonts/JetBrainsMono/ 
fc-cache

echo "install programs from .deb"
curl -s "https://api.github.com/repos/git-ecosystem/git-credential-manager/releases/latest" | grep browser_download_url | grep 'gcm-linux_amd64.*\.deb' | cut -d '"' -f 4 | xargs curl -sL -o /tmp/gcm.deb
curl -sL "https://discord.com/api/download?platform=linux&format=deb" -o /tmp/discord.deb
curl -sL "https://go.microsoft.com/fwlink/?LinkID=760868" -o /tmp/vscode.deb
curl -sL "http://ftp.uk.debian.org/debian/pool/contrib/t/torbrowser-launcher/torbrowser-launcher_0.3.7-3_amd64.deb" -o /tmp/tor.deb
sudo dpkg -i /tmp/gcm.deb /tmp/discord.deb
# using apt to avoid vscode prompt and for some reason tor doesnt get installed using dpkg
sudo apt-get install -qq -y /tmp/vscode.deb /tmp/tor.deb

echo "install rust"
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# WARNING: this will run standard rust install (selecting the first option on install)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"
rustup update

echo "install yazi"
cargo install --force yazi-build

# add flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "install flatpak packages"
sudo flatpak install -y app/md.obsidian.Obsidian/x86_64/stable com.protonvpn.ww 

echo "install nvidia drivers"
sudo apt-get install -qq -y linux-headers-amd64 nvidia-kernel-dkms nvidia-driver

# this just freezes dolphin and other apps when they start so remove them
sudo apt-get purge -y xdg-desktop-portal*
sudo apt-get autoremove -y

echo "enable network manager service"
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

# speeds up boot-time
sudo systemctl disable NetworkManager-wait-online.service

# core dump size
ulimit -c unlimited

# install other programs
echo "install gf2"
git clone https://amitshky@github.com/nakst/gf.git ~/dev-not-mine/gf
cd $HOME/dev-not-mine/gf/
./build.sh
sudo cp gf2 /usr/local/bin
cd $PWD
