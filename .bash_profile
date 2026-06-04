[ -f ~/.profile ] && source ~/.profile

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi
. "$HOME/.cargo/env"


# Added by Antigravity CLI installer
export PATH="/home/almostblue/.local/bin:$PATH"
