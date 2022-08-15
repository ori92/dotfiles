#!/bin/zsh

export FZF_PREVIEW="[[ -d {} ]] && lsd --color=always -l --total-size --blocks=name,size {} || bat --style=numbers --color=always --line-range :50 {}"
export FZF_KEY_BINDS="\
    --bind 'ctrl-e:execute-silent(tmux new-window lvim -f {})'
    --bind 'ctrl-d:execute-silent(dolphin \$(dirname {}) &)'
    --bind 'ctrl-k:execute-silent(echo -n \" \" |xclip -sel clip)'
    --bind 'ctrl-a:execute-silent(echo \"\$(xclip -sel clip -o) \n {}\" |xclip -sel clip)'
    --bind 'ctrl-y:execute-silent(echo -n {} | xclip -sel clip)'
    --bind '?:preview:$FZF_PREVIEW'"
export FZF_EXCLUDE="-E .git -E .cache -E cache -E .nuget -E Brave-Browser -E CachedData -E Cache -E site-packages -E icons -E .cargo -E node_modules -E .npm -E .vscode -E .rustup -E .icons -E .dotnet"
export FZF_DEFAULT_COMMAND="fd --color=always -H $FZF_EXCLUDE"
export FZF_DEFAULT_OPTS="--ansi --multi --layout=reverse --preview-window hidden $FZF_KEY_BINDS"
export FZF_COMPLETION_TRIGGER='``'
export FZF_COMPLETION_OPTS="+c -x +s"
export FZF_ALT_C_COMMAND="fd -H --type d --color=always -E /proc -E /sys -E /dev --full-path . / "
export FZF_ALT_C_OPTS="$FZF_KEY_BINDS --preview 'lsd --color=always -l --total-size --blocks=name,size {}' --preview-window default"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND "
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS --preview '$FZF_PREVIEW {}' --preview-window default"
export FZF_CTRL_R_OPTS='--sort --exact'

# Use fd to generate the list for files/directory completion
_fzf_compgen_path() {
    fd --hidden --follow --color=always -H $FZF_EXCLUDE "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --color=always -H $FZF_EXCLUDE "$1"
}
bindkey '^s' fzf-file-widget

source /usr/share/fzf/key-bindings.zsh