#!/bin/sh

STATE_FILE="$HOME/.cache/wallpaper_last"

IMAGE="$1"

# if no argument passed, reuse last wallpaper
if [ -z "$IMAGE" ]; then
    if [ -f "$STATE_FILE" ]; then
        IMAGE="$(cat "$STATE_FILE")"
    else
        IMAGE="$HOME/pictures/slideshow/stellar-blade-blood-rain-evie-0.jpg"
    fi
fi

# apply wallpaper
feh --no-fehbg --bg-fill "$IMAGE"

# save current choice as new default
echo "$IMAGE" > "$STATE_FILE"
