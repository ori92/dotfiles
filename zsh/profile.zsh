#!/bin/zsh

# PATH Variable
typeset -U path
path+=("$HOME/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.local/share/gem/ruby/3.0.0/bin")
export PATH

# Environment
export BROWSER="brave"                                      # Browser
export COMPLETION_WAITING_DOTS="true"                       # Display dots while waiting for completion
export DISABLE_UNTRACKED_FILES_DIRTY="true"                 # oh-my-zsh: Use this setting if you want to disable marking untracked files under VCS as dirty. This makes repository status checks for large repositories much, much faster.
export EDITOR="/usr/bin/lvim"                               # Text-editor
export GTK_RC_FILES="/etc/gtk/gtkrc:$HOME/.config/gtkrc"    # gtk config files location
export HIST_STAMPS="%d/%m/%y %T"                            # Timestamps in history
export HISTFILE="$HOME/.config/zsh/.zsh_history"            # History-file location
export HYPHEN_INSENSITIVE="true"                            # oh-my-zsh: Underscores (_) and hyphens (-) will be interchangeable
export LC_ALL="en_US.UTF-8"                                 # Locale
export LC_MESSAGES="C"                                      # Locale
export LESSHISTFILE="-"                                     # Disable less history file
export NODE_REPL_HISTORY="$HOME/.config/.node_repl_history" # node repl history location.
export PAGER="bat"                                          # pager with syntax highlight
export RANGER_LOAD_DEFAULT_RC="FALSE"                       # stop ranger from loading both the default and your custom rc.conf
export SYSTEMD_EDITOR="/usr/bin/lvim"                       # EDITOR for systemd
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'                   # Word characters - usefull when ^W or alt-bs to backwards kill a word
export XDG_CACHE_HOME="$HOME/.cache/"                       # Default cache directory
export XIVIEWER="gwenview"                                  # Image-viewer

# Use neovim as pager for man-pages `:h Man`
export MANPAGER="/usr/bin/lvim +Man!"
export MANWIDTH=999

# Auto-Suggest
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#49a8de,bg=#d0d7db,bold,underline"
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"

# Auto start tmux on login
export ZSH_TMUX_AUTOSTART=true
