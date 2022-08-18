#!/bin/zsh

export FZF_HEADER="C-v:Code, C-e:Lvim, C-d:Dolphin, C-k:Clear clip, C-A:Append clip, C-y:Yank,
C-Y:Yank content, Alt+Up/Down:scroll preview, /:Enter dir"

export FZF_KEY_BINDS="\
    --bind 'ctrl-e:execute-silent(tmux new-window lvim -f {})'
    --bind 'ctrl-d:execute-silent(dolphin \$(dirname {}) &)'
    --bind 'ctrl-k:execute-silent(echo -n \" \" |xclip -sel clip)'
    --bind 'ctrl-A:execute-silent(echo \"\$(xclip -sel clip -o) \n {}\" |xclip -sel clip)'
    --bind 'ctrl-y:execute-silent(echo -n {} | xclip -sel clip)'
    --bind '?:preview:$ZDOTDIR/scripts/preview.zsh {}'
    --bind 'tab:down'
    --bind 'btab:up'
    --bind 'space:toggle+down'
    --bind 'ctrl-A:toggle-all'
    --bind 'alt-up:preview-up'
    --bind 'alt-down:preview-down'
    --bind '/:accept-non-empty'
    "

export FZF_EXCLUDE="-E .git -E .cache -E cache -E .nuget -E Brave-Browser -E CachedData -E Cache -E site-packages -E icons -E .cargo -E node_modules -E .npm -E .vscode -E .rustup -E .icons -E .dotnet"

# Fzf Defaults
export FZF_DEFAULT_COMMAND="fd --color=always --hidden $FZF_EXCLUDE"
export FZF_DEFAULT_OPTS="--border=rounded $FZF_KEY_BINDS --header=\"$FZF_HEADER\" --ansi --multi --layout=reverse --height 40%  --exit-0 --select-1"

# Completion while typing `` + Tab
export FZF_COMPLETION_TRIGGER='``'
export FZF_COMPLETION_OPTS="--preview-window hidden --preview '$ZDOTDIR/scripts/preview.zsh {}'"

# Fast cd
export FZF_ALT_C_COMMAND="fd --hidden --type d --color=always -E /proc -E /sys -E /dev --full-path . / "
export FZF_ALT_C_OPTS="--preview 'lsd --color=always -l --total-size --blocks=name,size {}' --preview-window default --select-1 --exit-0"

# File Chooser
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview-window default --preview '$ZDOTDIR/scripts/preview.zsh {}' --select-1 --exit-0"

# History
export FZF_CTRL_R_OPTS='--sort --exact'

# Use fd to generate the list for files/directory completion
_fzf_compgen_path() {
    fd --hidden --follow --color=always $FZF_EXCLUDE "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --color=always $FZF_EXCLUDE "$1"
}

source /usr/share/fzf/key-bindings.zsh

# FZF-Tab

zstyle ':fzf-tab:*' fzf-flags --height 35% --preview-window 50% --header $FZF_HEADER --layout=reverse --border=rounded

# bindings
zstyle ':fzf-tab:*' fzf-bindings \
    'ctrl-v:execute-silent({_FTB_INIT_}code "$realpath")' \
    'ctrl-e:execute-silent({_FTB_INIT_}tmux new-window lvim "$realpath")' \
    'ctrl-d:execute-silent({_FTB_INIT_}dolphin $(dirname "$realpath"))' \
    'ctrl-k:execute-silent({_FTB_INIT_}echo -n " " |xclip -sel clip)' \
    'ctrl-a:execute-silent({_FTB_INIT_}echo "$(xclip -sel clip -o) \\n $word" |xclip -sel clip)' \
    'ctrl-y:execute-silent({_FTB_INIT_}echo -n "$word" | xclip -sel clip)' \
    'ctrl-Y:execute-silent({_FTB_INIT_}cat "$realpath" | xclip -sel clip)+preview({_FTB_INIT_}echo "Copied content of \"${realpath}\" to clipboard")' \
    'alt-up:preview-up' \
    'alt-down:preview-down'

# disable preview for command options
zstyle ':fzf-tab:complete:*:options' fzf-preview
# disable preview for subcommands
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview

# preview
zstyle ':fzf-tab:complete:*:*' fzf-preview '$ZDOTDIR/scripts/preview.zsh ${(Q)realpath}'

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "procs --no-header"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview 'ps --pid=$word -o pid,cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# show systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# parameters
zstyle ':fzf-tab:complete:parameter:*' fzf-flags --preview-window=hidden

# git
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff --color=always $word'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
    'case "$group" in
  "commit tag") git show --color=always $word ;;
  *) git show --color=always $word ;;
  esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'case "$group" in
  "modified file") git diff --color=always $word ;;
  "recent commit object name") git show --color=always $word | delta ;;
   *) git log --color=always $word ;;
  esac'

# tldr
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'

# disable sort when completing options of any command
zstyle ':completion:complete:*:options' sort false

# switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'

# remove '.' and '..' from completion
zstyle ':completion:*' special-dirs false

zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'pacman -Si $word | rg --no-line-number "Name|Version|URl|Size|Repository|Description|Depends On" 2>/dev/null'
