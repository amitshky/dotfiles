alias so='source ~/.bashrc'

alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alh'
alias ls='ls --color=auto'
alias vdir='vdir --color=auto'

alias lg="lazygit"
alias ti="tmuxinit"
alias t="tmux"
alias qi="qimgv"
alias n="nvim ."
alias m="NVIM_APPNAME=nvim-minimal nvim ."
alias mvim="NVIM_APPNAME=nvim-minimal nvim"
alias wd="cd ~/dev/"
alias wc="cd ~/dotfiles/"
alias wo="cd ~/sync/ObsidianVault/"
alias wu="cd ~/documents/notes/"
# alias cat="bat" # use \cat to override this alias and use the actual cat command

alias cdwm="sudo make -C \"$HOME/.local/src/dwm\" clean install"
alias cst="sudo make -C \"$HOME/.local/src/st\" clean install"
alias cdm="sudo make -C \"$HOME/.local/src/dmenu\" clean install"
alias cdb="sudo make -C \"$HOME/.local/src/dwmblocks-async\" clean install"
# alias csl="sudo make -C \"$HOME/.local/src/slock\" clean install"
alias csl=""
alias csall="cdwm && cdm && cdb && cst && csl" # compile all suckless tools
