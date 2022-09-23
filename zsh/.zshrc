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
    tmux new-session -d -A -s SSH &&
    tmux source $XDG_CONFIG_HOME/tmux/tmux.conf && # workaround to enable remote theme
    tmux attach -t SSH

plugins=(
    autoupdate copybuffer copyfile copypath
    extract fzf fzf-tab git sudo you-should-use
    zsh-autopair zsh-autosuggestions fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/profile.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/colors.zsh
source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/filetype.zsh
source $ZDOTDIR/mf.zsh

bindkey '^s' fzf-file-widget
bindkey '^x' expand-alias

eval "$(/usr/bin/navi widget zsh)"   # navi
eval "$(/usr/bin/zoxide init zsh)"   # zoxide
eval "$(/usr/bin/starship init zsh)" # starship-prompt
