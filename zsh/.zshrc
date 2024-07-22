#!/bin/zsh

macchina --theme ori # Pretty startup :)

setopt noclobber
setopt appendcreate
setopt extendedglob
setopt dotglob

plugins=(
    autoupdate copybuffer copyfile copypath
    extract fzf fzf-tab git sudo you-should-use
    zsh-autopair zsh-autosuggestions fast-syntax-highlighting
    docker kubectl
)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/profile.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/colors.zsh
source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/filetype.zsh
source $ZDOTDIR/pentest.zsh          # Penetration testing 

bindkey '^s' fzf-file-widget
bindkey '^x' expand-alias

eval "$(/usr/bin/navi widget zsh)"   # navi
eval "$(/usr/bin/zoxide init zsh)"   # zoxide
eval "$(/usr/bin/starship init zsh)" # starship-prompt

$HOME/.config/tmux/scripts/tmux-global-logging.sh # Log all tmux output
