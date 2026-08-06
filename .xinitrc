#! /usr/bin/env bash

# programs
picom -b
xsettingsd &
lxqt-powermanagement &
light-locker --no-lock-on-lid &
flameshot &
copyq &
dwmblocks &
syncthing --no-browser &
dunst &

# for dolphin
# /usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &

# scripts
change_walpaper.sh
dual_right_display &
volume_signal &
brightness_signal &
battery_signal &
hide_cursor &
volume_level &
cleanup &

xss-lock --transfer-sleep-lock lockscreen &

xset -dpms # disable display power management signal
xset s 0 0

xrdb ~/.Xresources

# exec dwm
# exec dbus-run-session dwm
exec dwm
