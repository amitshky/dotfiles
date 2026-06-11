#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

export PATH="$PATH:$HOME/.cargo/bin/:/sbin/:$HOME/.local/bin:$HOME/.local/scripts:$HOME/programs/arduino-ide_2.3.8_Linux_64bit/"

# enable bat to colorize man pages
# export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

export QT_QPA_PLATFORMTHEME=qt5ct
export GPG_TTY=$(tty)
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export WEBOTS_HOME="/usr/local/webots"

# customizing prompt
git_branch_for_prompt() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}
PROMPT_BLUE='\[\033[0;34m\]'
PROMPT_PURPLE='\[\033[0;35m'
PROMPT_GREEN='\[\033[0;32m'
PROMPT_CLEAR_COLOR='\[\033[0m\]'
PS1="${PROMPT_BLUE}{ \u@\h}${PROMPT_PURPLE}[ \\w]${PROMPT_GREEN}( \$(git_branch_for_prompt))\\n\\$ ${PROMPT_CLEAR_COLOR}"

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
. "$HOME/.cargo/env"

# run ssh-agent
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" > /dev/null
