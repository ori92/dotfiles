#!/bin/zsh

# Environment
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin" # PATH
export EDITOR="lvim"                                                                 # Text-editor
export XIVIEWER="gwenview"                                                           # Image-viewer
export BROWSER="brave"                                                               # Browser
export HISTFILE="$HOME/.config/zsh/.zsh_history"                                     # History-file location
export SYSTEMD_EDITOR="lvim"                                                         # EDITOR for systemd
export LC_ALL="en_US.UTF-8"                                                          # Locale
export LC_MESSAGES="C"                                                               # Locale
export ZSH="$XDG_CONFIG_HOME/.oh-my-zsh"                                             # oh-my-zsh location
export COMPLETION_WAITING_DOTS="true"                                                # Display dots while waiting for completion
export HIST_STAMPS="%d/%m/%y %T"                                                     # Timestamps in history
export HYPHEN_INSENSITIVE=true                                                       # oh-my-zsh: Underscores (_) and hyphens (-) will be interchangeable
export DISABLE_UNTRACKED_FILES_DIRTY=true                                            # oh-my-zsh: Use this setting if you want to disable marking untracked files under VCS as dirty. This makes repository status checks for large repositories much, much faster.
export RANGER_LOAD_DEFAULT_RC='FALSE'                                                # stop ranger from loading both the default and your custom rc.conf
export NODE_REPL_HISTORY="$HOME/.config/.node_repl_history"                          # node repl history location.
export GTK_RC_FILES=/etc/gtk/gtkrc:$HOME/.config/gtkrc                               # gtk config files location
export LESSHISTFILE=-                                                                # Disable less history file

# FZF
export FZF_KEY_BINDS="\
    --bind 'ctrl-e:execute-silent(tmux new-window lvim -f {})'
    --bind 'ctrl-d:execute-silent(open_dir {})'
    --bind 'ctrl-k:execute-silent(echo -n \" \" |xclip -sel clip)'
    --bind 'ctrl-a:execute-silent(append_clip {})'
    --bind 'ctrl-y:execute-silent(echo -n {} | xclip -sel clip)'
    --bind '?:preview:preview_dir_or_file {}'"
export FZF_DEFAULT_COMMAND='fd --color=always -H -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages"  -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet"'
export FZF_DEFAULT_OPTS="--ansi --multi --layout=reverse --preview-window hidden $FZF_KEY_BINDS"
export FZF_COMPLETION_TRIGGER='``'
#export FZF_COMPLETION_OPTS='+c -x'
export FZF_ALT_C_COMMAND="fd -H --type d --color=always -E /proc -E /sys -E /dev --full-path . / "
export FZF_ALT_C_OPTS="$FZF_KEY_BINDS --preview 'lsd --color=always -l --total-size --blocks=name,size {}' --preview-window default"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND "
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS --preview 'preview_dir_or_file {}' --preview-window default"
#export FZF_CTRL_R_OPTS=""

# Auto-Suggest
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#49a8de,bg=#d0d7db,bold,underline"
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
