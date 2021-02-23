#!/bin/zsh

setopt noclobber

plugins=(
    zsh-syntax-highlighting zsh-autosuggestions you-should-use zsh_reload
    copyfile colorize extract
    sudo fzf z
    fzf-tab colored-man-pages
)

#Loading order does matter.
source /usr/share/fzf/key-bindings.zsh
source ~/.local/lib/python3.9/site-packages/scripts/shell/funky.sh # Funky ### NEET TO TEST ###
source ~/.config/zsh/functions.zsh
source ~/.config/.oh-my-zsh/oh-my-zsh.sh
source ~/.config/zsh/aliases.zsh

bindkey '^s' fzf-file-widget
bindkey '^x' expand-alias

eval $(thefuck --alias)
eval "$(starship init zsh)" # start Starship

#paleofetch
