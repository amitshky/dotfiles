# Setting up Arch

## Docker
```sh
pacman -S docker docker-buildx
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

