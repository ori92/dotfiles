#!/bin/zsh
neofetch
setopt noclobber

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile

# Display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

#Plugins
plugins=(
#common-aliases
copyfile
zsh-completions
colored-man-pages
colorize
zsh-autosuggestions
extract
sudo
z
#fasd
you-should-use
zsh-syntax-highlighting
fzf
zsh_reload
pip
npm
cargo
)

#autoload -U zmv
autoload -U compinit
compinit -d ~/.config/zsh/zcompdump-$ZSH_VERSION

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

eval $(thefuck --alias)

source ~/.config/.oh-my-zsh/oh-my-zsh.sh

# Funky
[ -f ~/.local/share/funky/funky.sh ] && source ~/.local/share/funky/funky.sh
# OVERRIDE PLIGIN ALIAS:
### must be after source oh-my-zsh


bindkey ^x expand-alias

# HSTR configuration
alias hh=hstr                    # hh to be alias for hstr
export HISTFILE="/home/ori/.config/zsh/.zsh_history"
export HSTR_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "\eqhh\n"     # bind hstr to Ctrl-r (for Vi mode check doc)

#==============================================================
#================           Functions          ================
#==============================================================
vim-edit-output() {
  file=`mktemp`.sh
  tmux capture-pane -pS -32768 > $file
  tmux new-window -n:mywindow "nvim '+ normal G $' $file"
}

math(){printf "%'.f\n" `echo "$1" |bc`}


timer() (
seconds=$(($1)); date1=$((`date +%s` + $seconds))
while [ "$date1" -ge `date +%s` ]; do
  echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r";
done
)

#Permanent Alias with palias
palias()(read  "answer?Are You Sure?[Y/N]"
  if [[ $answer =~ ^[Yy]$ ]]
    then
    echo alias "$*" >> ~/.zshrc
    alias -g "$*"
    echo Alias Created in .zshrc!
    tmux send-keys "alias $*" Enter
  fi)

bak()(mv $1 $1.bak)

#Replace String in text file
repl()(cat $1 | sed "s/$2/$3/g" > $1.new; rm -rf $1; mv $1.new $1)

function expand-alias() {
        zle _expand_alias
        zle autosuggest-clear
}
zle -N expand-alias

inst(){
    if [[ -z "$1" ]]; then
    pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S
    else
    sudo pacman -S $@ || pamac install $@
    fi
}

# Auto ZCompile Sources
source () {
    if [[ ! "$1.zwc" -nt "$1" ]]; then
        if [[ ! $1 =~ "/proc/self" ]]; then
            zcompile "$1"
        fi
    fi
    builtin source $@
}


# Fix paste being slow because of the color plugin

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


source ~/.config/broot/launcher/bash/br
source ~/.config/zsh/aliases.zsh

#start Starship
eval "$(starship init zsh)"
