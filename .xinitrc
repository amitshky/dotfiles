#! /usr/bin/env bash

# load user environment
[ -f ~/.xprofile ] && . ~/.xprofile

# optional system-wide xprofile
[ -f /etc/xprofile ] && . /etc/xprofile

export QT_QPA_PLATFORMTHEME=qt5ct

feh --bg-fill $HOME/dotfiles/setup/wallpaper.jpg
picom -b

flameshot &
copyq &
dwmblocks &
syncthing --no-browser &
dunst &

# for dolphin
/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &

dual_right_display &
volume_signal &
brightness_signal &
battery_signal &
hide_cursor &
volume_level &

xset -dpms # disable display power management signal

xrdb ~/.Xresources

# change the scrolling direction of the touchpad
xinput set-prop "ELAN0504:01 04F3:3091 Touchpad" 318 1
xinput set-prop "ELAN0504:01 04F3:3091 Touchpad" 345 1
# enable tap to click
xinput set-prop "ELAN0504:01 04F3:3091 Touchpad" 347 1

# exec dwm
exec dbus-run-session dwm
