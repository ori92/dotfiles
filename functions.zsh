#!/bin/zsh

_fzf_compgen_path() {
  fd --hidden --follow --color=always -H -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages"  -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet" --full-path / "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --color=always -H -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages"  -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet" --full-path / "$1"
}

vim-edit-output() {
  file=`mktemp`.sh
  tmux capture-pane -pS -32768 > $file
  tmux new-window -n:mywindow "nvim '+ normal G $' $file"
}

math() {
	printf "%'.f\n" `echo "$1" |bc`
}

timer() (
seconds=$(($1)); date1=$((`date +%s` + $seconds))
while [ "$date1" -ge `date +%s` ]; do
  echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r";
done
)

# Permanent Alias with palias
palias()(read  "answer?Are You Sure?[y/N]"
  if [[ $answer =~ ^[Yy]$ ]]
    then
    echo alias "$*" >> ~/.zshrc
    alias -g "$*"
    echo Alias Created in .zshrc!
    tmux send-keys "alias $*" Enter
  fi)

# Create backup of a file
bak() {
	mv $1 $1.bak
}

# Replace String in text file
repl() {
	cat $1 | sed "s/$2/$3/g" > $1.new; rm -rf $1; mv $1.new $1
}

function expand-alias() {
        zle _expand_alias
        zle autosuggest-clear
}
zle -N expand-alias


inst(){
    if [[ -z "$1" ]]; then
    pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S
    else
    sudo pacman -S $@ || pamac install $@ || echo "Install Failed."
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
pasteinit() 
{
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() 
{
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

preview_dir_or_file() {
[[ -d $1 ]] && lsd --color=always -l --total-size --blocks=name,size $1 ||
bat --style=numbers --color=always --line-range :500 $1
}
