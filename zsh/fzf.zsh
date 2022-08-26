#!/bin/zsh

# TODO: Better annotate.

export FZF_HEADER="
c-a     : toggle all
c-d     : dolphin
c-e     : lvim
c-k     : clear clip
c-p     : preview
c-s     : append clip
c-v     : code
c-x     : yank content
c-y     : yank
c-z     : show keys
/       : Eenter dir
alt-⬆️/⬇ : scroll preview"

export FZF_KEY_BINDS="\
    --bind 'ctrl-a:toggle-all'
    --bind 'ctrl-d:execute-silent(dolphin \$(dirname {}) &)'
    --bind 'ctrl-e:execute-silent(tmux new-window lvim -f {})'
    --bind 'ctrl-k:execute-silent(echo -n \" \" |xclip -sel clip)'
    --bind 'ctrl-p:execute-silent(tmux popup -h 90% -w 90% bat {})'
    --bind 'ctrl-s:execute-silent(echo \$(xclip -sel clip -o) \\\\n {} |xclip -sel clip)+preview(echo Added to clipboard)'
    --bind 'ctrl-v:execute-silent(code {})'
    --bind 'ctrl-x:execute-silent(cat \$realpath | xclip -sel clip)+preview(echo Copied content of {} to clipboard)'
    --bind 'ctrl-y:execute-silent(echo -n {} | xclip -sel clip)'
    --bind 'ctrl-z:preview(echo \$FZF_HEADER)'
    --bind '?:preview:$ZDOTDIR/scripts/preview.zsh {}'
    --bind 'tab:down'
    --bind 'btab:up'
    --bind 'alt-up:preview-up'
    --bind 'alt-down:preview-down'
    --bind '/:accept-non-empty'
    "

# Fzf Defaults
export FZF_DEFAULT_COMMAND="fd --no-ignore --color=always --hidden --strip-cwd-prefix"
export FZF_DEFAULT_OPTS="--border=rounded $FZF_KEY_BINDS --ansi --multi --layout=reverse --height 40%               
                         --select-1 --exit-0"

# Completion while typing `` + Tab
export FZF_COMPLETION_TRIGGER='``'
export FZF_COMPLETION_OPTS="--preview '$ZDOTDIR/scripts/preview.zsh {}'
                            --preview-window hidden --select-1 --exit-0"

# Fast cd
export FZF_ALT_C_COMMAND="fd --no-ignore --color=always --hidden --type d --strip-cwd-prefix" 
export FZF_ALT_C_OPTS="--preview 'lsd --color=always -l --total-size --blocks=name,size {}'
                       --preview-window default --select-1 --exit-0"

# File Chooser
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '$ZDOTDIR/scripts/preview.zsh {}'
                        --preview-window default --select-1 --exit-0"

# History
export FZF_CTRL_R_OPTS='--sort --exact'

# Use fd to generate the list for files/di>rectory completion
_fzf_compgen_path() {
    fd --no-ignore --hidden --follow --color=always --strip-cwd-prefix "$1"
}
_fzf_compgen_dir() {
    fd --no-ignore --type d --hidden --follow --color=always --strip-cwd-prefix "$1"
}

#=================================
#===          FZF-Tab          ===
#=================================

zstyle ':fzf-tab:*' fzf-flags --height 40% --preview-window 50% --layout=reverse --border=rounded

# bindings
zstyle ':fzf-tab:*' fzf-bindings \
    'ctrl-a:toggle-all' \
    'ctrl-d:execute-silent({_FTB_INIT_}dolphin $(dirname "$realpath"))' \
    'ctrl-e:execute-silent({_FTB_INIT_}tmux new-window lvim "$realpath")' \
    'ctrl-k:execute-silent({_FTB_INIT_}echo -n " " |xclip -sel clip)' \
    'ctrl-p:execute-silent({_FTB_INIT_}tmux popup -h 90% -w 90% bat "$realpath")' \
    'ctrl-s:execute-silent({_FTB_INIT_}echo "$(xclip -sel clip -o) \\n $word" |xclip -sel clip)' \
    'ctrl-v:execute-silent({_FTB_INIT_}code "$realpath")' \
    'ctrl-x:execute-silent({_FTB_INIT_}cat "$realpath" | xclip -sel clip)+preview({_FTB_INIT_}echo "Copied content of \"${realpath}\" to clipboard")' \
    'ctrl-y:execute-silent({_FTB_INIT_}echo -n "$word" | xclip -sel clip)' \
    'ctrl-z:preview(echo $FZF_HEADER)' \
    'alt-up:preview-up' \
    'alt-down:preview-down' \
    '/:accept-non-empty'


zstyle ':fzf-tab:complete:*:*' fzf-preview '$ZDOTDIR/scripts/preview.zsh ${(Q)realpath}'                                                                       # preview
zstyle ':fzf-tab:complete:*:options' fzf-preview                                                                                                               # disable preview for command options
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview                                                                                                            # disable preview for subcommands
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'                                                                 # systemd unit status
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'                                       # environment variable
zstyle ':fzf-tab:complete:parameter:*' fzf-flags --preview-window=hidden                                                                                       # parameters
zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'pacman -Si $word | rg --no-line-number "Name|Version|URl|Size|Repository|Description|Depends On" 2>/dev/null' # completions for pacman
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'                                                                             # completions for tldr
zstyle ':completion:complete:*:options' sort false                                                                                                             # disable sort when completing options of any command

# give a preview of commandline arguments when completing `kill` # TODO: better preview of ps 
zstyle ':completion:*:*:*:*:processes' command "procs --no-header"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview 'ps --pid=$word -o pid,cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

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
    

zstyle ':completion:*:git-checkout:*' sort false # disable sort when completing `git checkout`
zstyle ':completion:*' special-dirs false # remove '.' and '..' from completion (so annoying!)
zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # set list-colors to enable filename colorizing
zstyle ':fzf-tab:*' switch-group ',' '.' # switch group using `,` and `.`
