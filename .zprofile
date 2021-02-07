
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
export FZF_DEFAULT_COMMAND='fd --type file --color=always -H -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages"  -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet"'
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}' --ansi -m --layout=reverse"
export FZF_COMPLETION_TRIGGER='``'

_fzf_compgen_path() {
  fd --hidden --follow --color=always -H -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages"  -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet" --full-path / "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --color=always -H -E ".git" -E ".cache" -E "cache" -E ".nuget" -E "Brave-Browser" -E "CachedData" -E "Cache" -E "site-packages"  -E "icons" -E ".cargo" -E ".oh-my-zsh/lib" -E "node_modules" -E "sublime-text-3" -E ".npm" -E "linux-ck" -E "themes" -E ".themes" -E ".vscode" -E ".rustup" -E "golang.org" -E "google.golang.org" -E "nvim/bundle" -E ".icons" -E ".dotnet" --full-path / "$1"
}

