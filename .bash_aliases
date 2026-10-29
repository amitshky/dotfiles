alias sb='source ~/.bashrc'

alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alh'
alias ls='ls --color=auto'
alias vdir='vdir --color=auto'

alias cat="bat --theme=gruvbox-dark" # use \cat to override this alias and use the actual cat command
alias lg="lazygit"
alias mvim="NVIM_APPNAME=nvim-minimal nvim"
alias qi="qimgv"
alias r="ranger"
alias t="tmux"
alias wc="cd ~/dotfiles/"
alias wd="cd ~/dev/"
alias wo="cd ~/sync/ObsidianVault/"
alias wu="cd ~/documents/notes/"
alias z="zellij"

alias cdwm="sudo make -C \"$HOME/.local/src/dwm\" clean install"
alias cst="sudo make -C \"$HOME/.local/src/st\" clean install"
alias cdm="sudo make -C \"$HOME/.local/src/dmenu\" clean install"
alias cdb="sudo make -C \"$HOME/.local/src/dwmblocks-async\" clean install"
# alias csl="sudo make -C \"$HOME/.local/src/slock\" clean install"
alias csall="cdwm && cdm && cdb && cst" # compile all suckless tools

alias dolphin="dolphin -stylesheet $HOME/.config/qt/dolpin-darkmode-fix.qss"

alias pa='pyenv activate'
alias pd='pyenv deactivate'
