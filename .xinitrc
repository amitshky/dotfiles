#! /usr/bin/env bash

# feh --bg-fill $HOME/dotfiles/setup/wallpaper.jpg
change_wallpaper.sh
picom -b

flameshot &
copyq &
dwmblocks &
syncthing --no-browser &
dunst &

# for dolphin
# /usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &

dual_right_display &

volume_signal &
brightness_signal &
battery_signal &

xsettingsd &
lxqt-powermanagement &
light-locker &

hide_cursor &
volume_level &

xss-lock --transfer-sleep-lock lockscreen &

xset -dpms # disable display power management signal
xset s 0 0

xrdb ~/.Xresources

# exec dwm
# exec dbus-run-session dwm
exec dwm
