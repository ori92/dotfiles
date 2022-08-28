#!/bin/zsh

macchina --theme ori # For pretty startup :)

setopt noclobber
setopt appendcreate
setopt extendedglob
setopt dotglob

# Auto start tmux on TTY
[ "$TERM" = "linux" ] &&
    tmux new-session -A -s $(basename $(tty))

# Auto start tmux over SSH
[ -n "$PS1" ] && [ -z "$TMUX" ] && [ -n "$SSH_CONNECTION" ] &&
    tmux new-session -A -s SSH

plugins=(
    autoupdate copybuffer copyfile copypath
    extract fzf fzf-tab git sudo you-should-use
    zsh-autopair zsh-autosuggestions zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/profile.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/colors.zsh
source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/pentest.zsh
source $ZDOTDIR/filetype.zsh
source $ZDOTDIR/mf.zsh

bindkey '^s' fzf-file-widget
bindkey '^x' expand-alias

eval "$(zoxide init zsh)"   # start zoxide
eval "$(starship init zsh)" # start starship-prompt
