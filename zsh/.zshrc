#!/bin/zsh

setopt noclobber
setopt appendcreate
setopt extendedglob
setopt dotglob

#Set TTY font and auto start tmux on tty (very handy!)
[ "$TERM" = "linux" ] && setfont ter-u32n &&
    tmux new-session -s $(basename $(tty))

plugins=(
    zsh-autosuggestions you-should-use 
    copyfile colorize extract copybuffer
    sudo fzf fzf-tab colored-man-pages
    autoupdate zsh-autopair zsh-syntax-highlighting calc
)

# Auto ZCompile Sources
source() {
    if [[ ! "$1.zwc" -nt "$1" ]]; then
        if [[ ! $1 =~ "/proc/self" ]]; then
            zcompile "$1"
        fi
    fi
    builtin source $@
}

# Loading order does matter.
source /usr/share/fzf/key-bindings.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/.oh-my-zsh/oh-my-zsh.sh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/pentest.zsh

source /usr/share/nvm/init-nvm.sh #nvm

bindkey '^s' fzf-file-widget
bindkey '^x' expand-alias

eval "$(zoxide init zsh)"   # start zoxide
eval "$(starship init zsh)" # start Starship

neofetch
