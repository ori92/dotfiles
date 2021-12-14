#!/bin/zsh

_fzf_compgen_path() {
  fd --hidden --follow --color=always -H -E ".ccache" -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages" -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet" --full-path / "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --color=always -H -E ".ccache" -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages" -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet" --full-path / "$1"
}

# edit tmux output with vim
vim-edit-output() {
  file=$(mktemp).sh
  tmux capture-pane -pS -32768 >$file
  tmux new-window -n:mywindow "lvim '+ normal G $' $file"
}

math() {
  printf "%'.f\n" $(echo "$1" | bc)
}

#Timer
stimer() (
  seconds=$(($1))
  date1=$(($(date +%s) + $seconds))
  while [ "$date1" -ge $(date +%s) ]; do
    echo -ne "$(date -u --date @$(($date1 - $(date +%s))) +%H:%M:%S)\r"
    sleep .5
  done
  notify-send "$2"
  paplay ~/bin/notification.wav
  kdialog --msgbox "$2"
)

timer() (
  [[ "$#" -ne 2 ]] && echo "timer 'minutes' 'message'" && exit
  stimer $((60 * $1)) $2
)

#Counter
count() (
  SECONDS=0
  while [ true ]; do
    echo -ne "$(date -d@"$SECONDS" -u +%H:%M:%S) \r"
    sleep 1
  done
)

# Permanent Alias with palias
palias() (
  read "answer?Are You Sure?[y/N]"
  if [[ $answer =~ ^[Yy]$ ]]; then
    echo alias "$*" >>~/.config/zsh/aliases.zsh
    alias -g "$*"
    echo Alias Created in aliases.zsh!
    tmux send-keys "alias $*" Enter
  fi
)

# Create backup of a file
bak() {
  mv $1 $1.bak
}

# Replace String in text file
repl() {
  sed -i "s/$2/$3/g" $1
}

# expand alias on prompt
expand-alias() {
  zle _expand_alias
  zle autosuggest-clear
}
zle -N expand-alias

# install package with pamac
inst() {
  if [[ -z "$1" ]]; then
    pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S
  else
    pamac install $@ || echo "Failed."
  fi
}

# reinstall package with pamac
reinst() {
  pamac reinstall $1
}

# Fix paste being slow because of the highlight plugin
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# set fan speed manually
fan1() {
  echo $1 | sudo tee /sys/devices/virtual/hwmon/hwmon1/pwm1
}
fan2() {
  echo $1 | sudo tee /sys/devices/virtual/hwmon/hwmon1/pwm3
}

# execute neovim with vertical splits by default if multiple files are opend.
v() {
  if [ $# -eq 2 ]; then
    lvim -O2 $@
  elif [ $# -gt 2 ]; then
    lvim -O3 $@
  else
    lvim $@
  fi
}

# get random number
rand() {
  echo $(( ($RANDOM % $1 ) + 1 ))
}
