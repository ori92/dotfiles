#!/bin/zsh

# Set EDITOR
export PATH="/home/ori/.local/bin:/home/ori/bin:/home/ori/.local/share/gem/ruby/3.0.0/bin:$PATH"
export EDITOR="lvim"
export XIVIEWER="gwenview"
export BROWSER="brave"
export HISTFILE="/home/ori/.config/zsh/.zsh_history"
export SYSTEMD_EDITOR="lvim"

# Set PATH and LOCAL
export LC_ALL="en_US.UTF-8"
export LC_MESSAGES="C"
export ZSH="/home/ori/.config/.oh-my-zsh"
export COMPLETION_WAITING_DOTS="true"
# oh-my-zsh: Underscores (_) and hyphens (-) will be interchangeable
export HYPHEN_INSENSITIVE=true
# oh-my-zsh: Use this setting if you want to disable marking untracked files under VCS as dirty. This makes repository status checks for large repositories much, much faster.
export DISABLE_UNTRACKED_FILES_DIRTY=true
export HIST_STAMPS="%d/%m/%y %T"
#stop ranger from loading both the default and your custom rc.conf
export RANGER_LOAD_DEFAULT_RC='FALSE'

# node repl history location.
export NODE_REPL_HISTORY="/home/ori/.config/.node_repl_history"

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
export FZF_ALT_C_COMMAND="fd -H --type d --color=always -E /proc -E /sys -E /dev --full-path . / /d"
export FZF_ALT_C_OPTS="$FZF_KEY_BINDS --preview 'lsd --color=always -l --total-size --blocks=name,size {}' --preview-window default"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND "
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS --preview 'preview_dir_or_file {}' --preview-window default"
#export FZF_CTRL_R_OPTS=""

# Auto-Suggest
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#49a8de,bg=#d0d7db,bold,underline"
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"

# # ccache
# export CCACHE_DIR="/home/ori/.ccache"
# export CC="ccache gcc"
# export CXX="ccache g++"
# export PATH="/usr/lib/ccache/bin:$PATH"

# gtk config files location
export GTK_RC_FILES=/etc/gtk/gtkrc:/home/ori/.config/gtkrc
