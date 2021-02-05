
# Set EDITOR
export EDITOR=nvim
  
# Set PATH and LOCAL
export PATH=/bin:/home/ori/.local/bin:/opt/idea/bin:/home/ori/bin
export LC_ALL=en_US.UTF-8
export LC_MESSAGES="C"
export ZSH="/home/ori/.config/.oh-my-zsh"

# node repl history location.
export NODE_REPL_HISTORY=/home/ori/.config/.node_repl_history
export _Z_DATA=~/.config/.z

# FZF 
export FZF_DEFAULT_COMMAND="fd --type file --color=always -H --exclude .git --exclude .cache --exclude cache --exclude .nuget"
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}' --ansi -m --layout=reverse"


