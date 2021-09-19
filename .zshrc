#!/bin/zsh

setopt noclobber
setopt appendcreate
setopt extendedglob

#Set TTY font and auto start tmux on tty (very handy!)
[ "$TERM" = "linux" ] && setfont ter-u32n &&
    tmux new-session -s $(basename $(tty))

plugins=(
    zsh-syntax-highlighting zsh-autosuggestions you-should-use zsh_reload
    copyfile colorize extract
    sudo fzf tmux
    fzf-tab colored-man-pages
    autoupdate
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
source ~/.local/lib/python3.9/site-packages/scripts/shell/funky.sh # Funky ### NEET TO TEST ###
source ~/.config/zsh/functions.zsh
source ~/.config/.oh-my-zsh/oh-my-zsh.sh
source ~/.config/zsh/aliases.zsh

bindkey '^s' fzf-file-widget
bindkey '^x' expand-alias

eval "$(zoxide init zsh)"   #start zoxide
eval "$(starship init zsh)" # start Starship

macchina --no-box --no-ascii --no-separator --bar --theme boron --palette --hide Machine --hide ProcessorUsage --hide Memory
