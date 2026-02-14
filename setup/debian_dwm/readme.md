# Setting up debian

## Install nvidia drivers
- [Reference](https://wiki.debian.org/NvidiaGraphicsDrivers)
```sh
nvim /etc/apt/sources.list
```
-  add/update following deb sources
    - NOTE: if you alreayd have `deb http://deb.debian.org/debian/ trixie main`, just append the rest of `contrib non-free non-free-firmware` (same for the other 2)
```sh
deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware
deb http://security.debian.org/debian-security/ trixie-security contrib non-free main non-free-firmware
deb http://deb.debian.org/debian/ trixie-updates non-free-firmware non-free contrib main
```
- then update and install drivers
```sh
apt update
apt upgrade
apt install linux-headers-amd64
apt install nvidia-kernel-dkms nvidia-driver
```
- verify the DKMS module compilation
```sh
dkms status
```
- then reboot

## Install jetbrains mono nerd font
- download jebrains mono nerd font then,
    - [download link](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip)
```sh
mkdir -p ~/.fonts/JetBrainsMono/
unzip JetBrainsMono.zip -d ~/.fonts/JetBrainsMono/ 
fc-cache
```

## Install rust
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
```

## After installing some of the packages
- NOTE: after installing pcmanfm, also move gtk-3.0 and gtk-4.0 folders to config
- NOTE: the file manager that I have here is pcmanfm and you can use lxapperance to change the theme of the file manager
```sh
cp ~/dev/config/linux_config/gtk-3.0/ ~/.config -r
cp ~/dev/config/linux_config/gtk-4.0/ ~/.config -r

# also do this for pinentry-gtk-2
cp ~/dev/config/linux_config/.gtkrc-2.0 ~/
```

## If you want to install dolphin using apt
- if you want to install dolphin, also install udisks2
    - you can query other devices (drives)
```sh
apt install dolphin udisks2 kde-cli-tools polkit-kde-agent-1
```
- add this to `~/.xinitrc`
```sh
/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &
```
- if you want to change the default terminal dolphin opens, change `~/.config/kdeglobals`
```sh
[General]
TerminalApplication=st
```
- for application menu
```sh
mkdir -p ~/.config/menus
cp ~/dev/config/linux_config/applications.menu ~/.config/menus/
```

## Setup Network Manager
```sh
nvim /etc/network/interfaces

# then remove/comment the lines

# The primary network interface
allow-hotplug wlp0s20f3
iface wlp0s20f3 inet dhcp
	wpa-ssid <wifi_name>
 	wpa-psk  <wifi_password>

# then
sudo nvim /etc/NetworkManager/NetworkManager.conf

# change managed to true
[main]
plugins=ifupdown,keyfile

[ifupdown]
managed=true

# stop the service and remove cache
sudo systemctl stop NetworkManager
sudo rm -rf /var/lib/NetworkManager/*

# check if interface is up
sudo ip link set wlp0s20f3 up

# start the service
sudo systemctl start NetworkManager
```

## Install VSCode
- download the .deb package from [here](https://code.visualstudio.com/docs/setup/linux#_install-vs-code-on-linux)
```sh
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
dpkg -i ./vscode.deb
```

## Add flathub repo (flatpak)
```sh
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## Install packages from cargo
- yazi (you have to build it)
    - dependencies `ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick`
```sh
cargo install --force yazi-build
```
- impala (wifi manager tui)
    - dependency `iwd` (there could be more)
```sh
cargo install impala
# then
nvim /usr/share/dbus-1/services/org.freedesktop.Notifications.service
# add these
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon/notification-daemon
```

## Install Ueberzugpp to render images in st
- download from [here](https://software.opensuse.org/download.html?project=home%3Ajustkidding&package=ueberzugpp)
```sh
apt install ./ueberzugpp_<version_latest>_amd64.deb
```
- Or you can do this for Debian 13
```sh
echo 'deb http://download.opensuse.org/repositories/home:/justkidding/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/home:justkidding.list
curl -fsSL https://download.opensuse.org/repositories/home:justkidding/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_justkidding.gpg > /dev/null
apt update
apt install ueberzugpp
```

## Install lightdm
- make `~/.xinitrc` executable
- then copy `../linux_config/dwm.desktop` to `/usr/share/xsessions/`
- and don't forget to change which session lightdm loads when you login
```sh
apt install lightdm
chmod +x ~/.xinitrc
cp ~/dev/config/linux_config/dwm.desktop /usr/share/xsessions/
```


## Configure git credential manager
- download gcm first then run the following
    - [v2.6.1](https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb)
```sh
dpkg -i gcm-linux_amd64.2.6.1.deb 
```

### Set up git-cm
```sh
gpg --full-generate-key 
git config --global credential.credentialStore gpg
git config --global credential.helper manager
pass init "<type ur id here>"
```

### Set up pinentry for git-cm
- include `export GPG_TTY=$(tty)` in `.bashrc`
```sh
cp ~/dev/config/linux_config/gpg-agent.conf ~/.gnupg/
```
- restart the agent
```sh
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
```

## Speeding-up boot-time
```sh
systemctl disable NetworkManager-wait-online.service
```

## Color schemes and theme customization
These might be useful
- [kde theming](https://www.lorenzobettini.it/2024/08/better-kde-theming-and-styling-in-hyprland/)
- [qt theming](https://www.hyprflux.dev/features/qt-theming.html#color-schemes)

## To disable Display power management signal
```sh
xset -dpms
```

## Remove unnecessary packages
- with these packages, some applications like localsend and dolphin were slow to startup and would freeze (more like there would be a transparent window when they started)
- [see issue](https://github.com/flatpak/xdg-desktop-portal/issues/1032)
```sh
# apt purge xdg-desktop-portal-gtk xdg-desktop-portal-kde xdg-desktop-portal-lxqt
apt purge xdg-desktop-portal*
apt autoremove
```

## To install Tor browser
- download from [here](https://packages.debian.org/search?keywords=torbrowser-launcher)
    - [UK mirror: 0.3.7-3-amd64](http://ftp.uk.debian.org/debian/pool/contrib/t/torbrowser-launcher/torbrowser-launcher_0.3.7-3_amd64.deb)
```sh
# verify the hash
echo "<sha256 hash> <torbrowser>.deb" | sha256sum -c -

# install
apt install <torbrowser>.deb
```

## To update default applications
- change `~/.config/mimeapps.list` then
- or you can also use command `xdg-mime default nemo.desktop inode/directory` (this will make nemo the default file manager)
```sh
update-desktop-database $HOME/.local/share/applications/
```

## To change the font/font-size of TTY
```sh
dpkg-reconfigure console-setup
```

## Change touchpad scroll direction
```sh
xinput list

# find the touchpad
# change the name in the quotations below to be the name of your touchpad
xinput list-props "ELAN0504:01 04F3:3091 Touchpad" | grep "Natural Scrolling Enabled"

# 318 is the id of the "Natural Scrolling Enabled" property
xinput set-prop "ELAN0504:01 04F3:3091 Touchpad" 318 1
```
