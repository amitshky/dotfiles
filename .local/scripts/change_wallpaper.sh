#!/bin/sh

IMAGE="$1"

# fallback if nothing passed
if [ -z "$IMAGE" ]; then
    IMAGE="/home/youruser/pictures/slideshow/stellar-blade-blood-rain-evie-0.jpg"
fi

# DISPLAY=:0 feh --no-fehbg --bg-fill --randomize ~/pictures/slideshow/{*.jpg,*.png}
feh --no-fehbg --bg-fill "$IMAGE"
