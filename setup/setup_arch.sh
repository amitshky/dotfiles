#!/usr/bin/env bash

PWD=$(pwd)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "installing packages"
sudo pacman -S --needed \
    7zip \
    adwaita-icon-theme \
    arandr \
    ark \
    base-devel \
    bash-completion \
    bat \
    bat-extras \
    bear \
    blender \
    bluez \
    bluez-utils \
    breeze \
    breeze-gtk \
    breeze-icons \
    brightnessctl \
    btop \
    chafa \
    clang \
    cloc \
    cmake \
    copyq \
    darktable \
    discord \
    docker \
    docker-buildx \
    dolphin \
    dunst \
    fastfetch \
    fd \
    feh \
    ffmpeg \
    filelight \
    firefox \
    flameshot \
    flatpak \
    fzf \
    gimp \
    git \
    gnome-themes-extra \
    gnupg \
    gpick \
    haruna \
    htop \
    htop \
    imagemagick \
    imagemagick \
    intel-media-driver \
    jq \
    kde-cli-tools \
    keepassxc \
    kimageformats \
    kio-admin \
    krename \
    lazygit \
    libqalculate \
    libreoffice-fresh \
    libx11 \
    libxcb \
    libxft \
    libxinerama \
    libxrandr \
    light-locker \
    lightdm \
    lightdm-slick-greeter \
    lxappearance \
    man-db \
    man-pages \
    mesa \
    mesa-utils \
    mkvtoolnix-gui \
    mpv \
    nano \
    neovim \
    networkmanager \
    nodejs \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    npm \
    ntfs-3g \
    okular \
    openssh \
    pass \
    pavucontrol \
    picom \
    pinentry \
    pipewire \
    pipewire-pulse \
    playerctl \
    polkit \
    polkit-kde-agent \
    poppler \
    pulsemixer \
    python \
    python-pip \
    qalc \
    qbittorrent \
    qt5ct \
    resvg \
    rfkill \
    ripgrep \
    stow \
    syncthing \
    terminus-font \
    texinfo \
    tmux \
    torbrowser-launcher \
    ttf-dejavu \
    udisks2 \
    ueberzugpp \
    unclutter \
    unrar \
    unzip \
    valgrind \
    vim \
    vlc \
    vlc-plugin-ffmpeg \
    vulkan-intel \
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
    yazi \
    yt-dlp \
    zoxide

echo "install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# WARNING: this will run standard rust install
# (selecting the first option on install)
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"
rustup update

echo "creating directories"
mkdir -p $HOME/{dev,dev-not-mine,.fonts,.config,.local,downloads,documents,desktop,music,pictures,videos}
sudo mkdir /mnt/{hdd,ssd,windows,camera}


# install other programs

echo "installing yay"
git clone https://aur.archlinux.org/yay.git "$HOME/dev-not-mine/yay" 
cd "$HOME/dev-not-mine/yay"
makepkg -si
cd $PWD
rm -rf "$HOME/dev-not-mine/yay"

echo "installing flatpak packages"
flatpak install -y app/md.obsidian.Obsidian/x86_64/stable \
    com.protonvpn.ww app/org.localsend.localsend_app/x86_64/stable 

echo "installing gf2"
git clone git@github.com:nakst/gf.git ~/dev-not-mine/gf
cd $HOME/dev-not-mine/gf/
./build.sh
sudo cp gf2 /usr/local/bin
cd $PWD

echo "installing from AUR"
yay -S \
    qimgv-git \
    visual-studio-code-bin
    --answerdiff None --answerclean All --noconfirm


# other configurations

echo "copying configs"
cd $SCRIPT_DIR/..
stow --adopt .
git restore .
cd $PWD

echo "installing fonts"
fc-cache

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
systemctl --user enable --now pipewire.socket pipewire-pulse.socket \
    wireplumber.service
systemctl --user start pipewire pipewire-pulse wireplumber
sudo systemctl enable lightdm


sudo printf "\n%s\n"\
"NTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org" \
"FallbackNTP=0.pool.ntp.org 1.pool.ntp.org 0.fr.pool.ntp.org" >> /etc/systemd/timesyncd.conf
timedatectl set-ntp true

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

# copy dm config
sudo cp $HOME/dotfiles/setup/lightdm/{lightdm.conf,slick-greeter.conf} /etc/lightdm/
sudo mkdir -p /usr/share/{xsessions,bg}
sudo cp $HOME/dotfiles/setup/lightdm/dwm.desktop /usr/share/xsessions/
sudo cp $HOME/dotfiles/setup/lightdm/startdwm /usr/local/bin/
sudo cp $HOME/dotfiles/setup/wallpaper.jpg /usr/share/bg/

# xinput config
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp $HOME/dotfiles/setup/X11/xorg.conf.d/30-touchpad.conf /etc/X11/xorg.conf.d/
sudo cp $HOME/dotfiles/setup/X11/xorg.conf.d/50-mouse-accel.conf /etc/X11/xorg.conf.d/


# create dolphin context menu options for custom actions
kbuildsycoca6
