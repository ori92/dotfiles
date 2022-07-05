#!/bin/zsh

neofetch # For pretty startup :)

setopt noclobber
setopt appendcreate
setopt extendedglob
setopt dotglob

# Set TTY font and auto start tmux on tty (very handy!)
[ "$TERM" = "linux" ] && setfont ter-u32n &&
    tmux new-session -A -s $(basename $(tty))

# Auto start tmux over SSH
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
    tmux new-session -A -s SSH
fi

plugins=(
    zsh-autosuggestions you-should-use
    copyfile colorize extract copybuffer
    sudo fzf fzf-tab colored-man-pages
    autoupdate zsh-autopair zsh-syntax-highlighting
)

# Loading, order does matters.
source /usr/share/fzf/key-bindings.zsh
source $ZDOTDIR/functions.zsh
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/pentest.zsh
source $ZDOTDIR/filetype.zsh
source $ZDOTDIR/colors.zsh
source $ZDOTDIR/mf.zsh

bindkey '^s' fzf-file-widget
bindkey '^x' expand-alias

eval "$(zoxide init zsh)"   # start zoxide
eval "$(starship init zsh)" # start starship-prompt
