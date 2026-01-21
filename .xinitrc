#! /usr/bin/env bash

feh --bg-fill ~/dotfiles/setup/wallpaper.png
picom -b

flameshot &
copyq &
dwmblocks &
syncthing --no-browser &
dunst &

# for dolphin
/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &

use_external_monitor &
volume_signal &
brightness_signal &
battery_signal &
hide_cursor &
volume_level &

xset -dpms # disable display power management signal

xrdb ~/.Xresources

exec dwm
