# Setting up Arch

## Docker
```sh
pacman -S docker docker-buildx docker-compose
```
- then run `dockerd` before using `docker` commands
- also add this to `~/.docker/config.json`
```json
{
  "detachKeys": "ctrl-@"
}
```

## ROS2 Installation
- Add arch4edu. See ([arch4edu repo](https://github.com/arch4edu/arch4edu/wiki/Add-arch4edu-to-your-Archlinux))
- install ros2
```sh
pacman -S ros2-humble
```

## Nvidia drivers
- checkout [archwiki Nvidia](https://wiki.archlinux.org/title/NVIDIA)
- this is for GTX1050
```sh
yay -S nvidia-580xx-dkms nvidia-580xx-utils
dkms status
sudo dkms autoinstall
sudo modprobe nvidia
reboot
```

## Arduino IDE
```sh
yay -S arduino-ide-bin
```
