#!/bin/zsh
neofetch

setopt noclobber

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile

#Set PATH
export PATH=/bin:/home/ori/.local/bin:/opt/idea/bin:/home/ori/bin

#LANG
export LC_ALL=en_US.UTF-8
export LC_MESSAGES="C"
# Path to your oh-my-zsh installation.
export ZSH="/home/ori/.config/.oh-my-zsh"

#node repl history location.
export NODE_REPL_HISTORY=/home/ori/.config/.node_repl_history


# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

#Plugins
plugins=(
common-aliases
#compleat
copyfile
zsh-completions
#tmux
colored-man-pages
colorize
#command-not-found
zsh-autosuggestions
extract
sudo
z
#fasd
you-should-use
#zsh-notes
zsh-syntax-highlighting
fzf
zsh_reload
#pip
)

#autoload -U zmv
autoload -U compinit
compinit -d /home/ori/.config/zsh/zcompdump-$ZSH_VERSION

#source /home/ori/.oh-my-zsh/custom/plugins/zsh-autopair/autopair.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

zle -N zle-line-init
zle -N zle-keymap-select

export EDITOR=nvim




[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

export FZF_DEFAULT_COMMAND="fd --type file --color=always -H --exclude .git --exclude .cache --exclude cache --exclude .nuget"
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}' --ansi -m --layout=reverse"

#Auto Compile sources
    if [[  "/home/ori/.zshrc" -nt "/home/ori/.zshrc.zwc" ]]; then
         zcompile /home/ori/.zshrc
    fi


eval $(thefuck --alias)

export _Z_DATA=~/.config/.z
source $ZSH/oh-my-zsh.sh

# Funky
[ -f ~/.local/share/funky/funky.sh ] && source ~/.local/share/funky/funky.sh
# OVERRIDE PLIGIN ALIAS:
### must be after source oh-my-zsh

######################################
########### Key Binings ##############
######################################

bindkey -s "\C-r" "\C-a hh -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
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

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


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
    sudo pacman -S $@
    fi
}

#Auto ZCompile Sources
source () {
    if [[ ! "$1.zwc" -nt "$1" ]]; then
        if [[ ! $1 =~ "/proc/self" ]]; then
            zcompile "$1"
        fi
    fi
    builtin source $@
}


#mv and cp using rsyng with progress
alias rcp='rsync -aP'
alias rmv='rsync -aP --remove-source-files'

alias vi='nvim'
alias serv='sudo python -m http.server'
alias rpac='sudo rm /var/lib/pacman/db.lck'
alias ls='lsd --group-dirs first --date relative -A'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias updt='sudo pacman -Syu'
alias rem='sudo pacman -R'
alias ex='chmod +x'
alias ctl='sudo systemctl'
alias top=bpytop
alias clip='xargs echo -n | xclip -selection clipboard'
alias msgbox='kdialog --msgbox '
alias l=lsd
alias lls="lsd -la --total-size"
alias c=cat
alias cc=ccat
alias grep='rg -i'
alias m=math
alias v=vi
alias e=echo
alias s="sudo "
alias srm="sudo rm -rf "
alias edit='subl'
alias q=fuck
alias fz='z `z| fzf`'
alias lf='fd -d 1 -a -H'
alias -g W='|wc -l'
alias -g S='|sed'
alias -g C='|tee >( clip )'
alias -g J='|jq'
alias -g GV='|rg -v'
alias udb='sudo updatedb'
alias send_to_phone='kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --ping-msg '
alias comp='compdef _gnu_generic ' # Generate completions for command

alias -g A='|awk'
alias -g A1="|awk '{print \$1}'"
alias -g A2="|awk '{print \$2}'"
alias -g A3="|awk '{print \$3}'"
alias -g A4="|awk '{print \$4}'"
alias -g A5="|awk '{print \$5}'"
alias -g A.1="|awk -F. '{print \$1}'"
alias -g A.2="|awk -F. '{print \$2}'"
alias -g A.3="|awk -F. '{print \$3}'"
alias -g A.4="|awk -F. '{print \$4}'"
alias -g A.5="|awk -F. '{print \$5}'"
alias -g A,1="|awk -F, '{print \$1}'"
alias -g A,2="|awk -F, '{print \$2}'"
alias -g A,3="|awk -F, '{print \$3}'"
alias -g A,4="|awk -F, '{print \$4}'"
alias -g A,5="|awk -F, '{print \$5}'"

#start Starship
eval "$(starship init zsh)"

source /home/ori/.config/broot/launcher/bash/br
