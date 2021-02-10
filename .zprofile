#!/bin/zsh

# Set EDITOR
export PATH="/bin:/home/ori/.local/bin:/opt/idea/bin:/home/ori/bin"
export EDITOR="nvim"
export XIVIEWER="gwenview"
export BROWSER="brave"
export HISTFILE="/home/ori/.config/zsh/.zsh_history"

# Set PATH and LOCAL
export LC_ALL="en_US.UTF-8"
export LC_MESSAGES="C"
export ZSH="/home/ori/.config/.oh-my-zsh"
export COMPLETION_WAITING_DOTS="true"

# node repl history location.
export NODE_REPL_HISTORY="/home/ori/.config/.node_repl_history"
export _Z_DATA="/home/ori/.config/.z"

# FZF
export FZF_DEFAULT_COMMAND='fd --type file --color=always -H -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages"  -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet"'
export FZF_DEFAULT_OPTS="--preview 'preview_dir_or_file {}' --ansi -m --layout=reverse"
export FZF_COMPLETION_TRIGGER='``'
export FZF_ALT_C_COMMAND="fd --type d --color=always --full-path . / /d"
export FZF_ALT_C_OPTS="--preview 'lsd --color=always -l --total-size --blocks=name,size {}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
#export FZF_CTRL_R_OPTS=""

# Auto-Suggest
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#49a8de,bg=#d0d7db,bold,underline"
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
