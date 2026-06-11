#!/usr/bin/env bash

echo "installing packages"
sudo pacman -S --needed \
    adwaita-icon-theme \
    arandr \
    ark \
    base-devel \
    bear \
    bluez \
    bluez-utils \
    breeze \
    breeze-icons \
    brightnessctl \
    btop \
    chafa \
    clang \
    clang-format \
    clang-tidy \
    cloc \
    cmake \
    copyq \
    discord \
    dolphin \
    dunst \
    fd \
    feh \
    ffmpeg \
    filelight \
    firefox \
    flameshot \
    flatpak \
    fzf \
    git \
    gnome-themes-extra \
    gnupg \
    imagemagick \
    jq \
    kde-cli-tools \
    keepassxc \
    lazygit \
    libqalculate \
    libreoffice-fresh \
    libx11 \
    libxcb \
    libxft \
    libxinerama \
    libxrandr \
    lxappearance \
    man-db \
    man-pages \
    mpv \
    nano \
    neovim \
    networkmanager \
    nodejs \
    noto-fonts \
    noto-fonts-emoji \
    npm \
    ntfs-3g \
    okular \
    pass \
    pavucontrol \
    pcmanfm \
    picom \
    pinentry \
    pipewire \
    pipewire-pulse \
    playerctl \
    polkit-kde-agent \
    poppler \
    pulsemixer \
    python \
    python-pip \
    qalc \
    qbittorrent \
    qt5ct \
    rfkill \
    ripgrep \
    stow \
    syncthing \
    texinfo \
    tmux \
    torbrowser-launcher \
    ttf-dejavu \
    udisks2 \
    ueberzugpp \
    unzip \
    valgrind \
    vim \
    wireplumber \
    xcb-util \
    xclip \
    xorg-server \
    xorg-setxkbmap \
    xorg-xauth \
    xorg-xev \
    xorg-xhost \
    xorg-xinit \
    xorg-xinput \
    xorg-xkbcomp \
    xorg-xkill \
    xorg-xmodmap \
    xorg-xprop \
    xorg-xrandr \
    xorg-xrdb \
    xorg-xset \
    xorg-xsetroot \
    zoxide

echo "install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# WARNING: this will run standard rust install (selecting the first option on install)
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"
rustup update

echo "creating directories"
mkdir -p $HOME/{dev,dev-not-mine,.fonts,.config,.local,downloads,documents,desktop,music,pictures,videos}
sudo mkdir /mnt/{hdd,ssd,windows,camera}

echo "cloning a few repos"
git clone https://amitshky@github.com/amitshky/st "$HOME/.local/src/st"
git clone https://amitshky@github.com/amitshky/dwm "$HOME/.local/src/dwm"
git clone https://amitshky@github.com/amitshky/dmenu "$HOME/.local/src/dmenu"
git clone https://amitshky@github.com/amitshky/dwmblocks-async \
    "$HOME/.local/src/dwmblocks-async"
git clone https://amitshky@github.com/amitshky/slock "$HOME/.local/src/slock"

# install other programs
echo "install gf2"
git clone git@github.com:nakst/gf.git ~/dev-not-mine/gf
cd $HOME/dev-not-mine/gf/
./build.sh
sudo cp gf2 /usr/local/bin
cd $PWD

echo "copying configs"
cd $SCRIPT_DIR/..
stow --adopt .
git restore .
cd $PWD

echo "installing fonts"
fc-cache

# other configurations

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
systemctl --user enable --now pipewire.socket pipewire-pulse.socket \
    wireplumber.service
systemctl --user start pipewire pipewire-pulse wireplumber

# speeds up boot-time
sudo systemctl disable NetworkManager-wait-online.service

# core dump size
ulimit -c unlimited

# change the scrolling direction of the touchpad
# WARNING: you may have to change the name of the touchpad device id
xinput set-prop "ELAN0504:01 04F3:3091 Touchpad" 318 1
# enable tap to click
xinput set-prop "ELAN0504:01 04F3:3091 Touchpad" 345 1
xinput set-prop "ELAN0504:01 04F3:3091 Touchpad" 347 1
