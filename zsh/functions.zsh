#!/bin/zsh

# Edit tmux output with vim
vim-edit-output() {
    file=$(mktemp).sh
    tmux capture-pane -pS -32768 >$file
    tmux new-window -n:mywindow "lvim '+ normal G $' $file"
}

math() {
    printf "%'.f\n" $(echo "$1" | bc)
}

# Timer
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

# Counter
count() (
    SECONDS=0
    while [ true ]; do
        echo -ne "$(date -d@"$SECONDS" -u +%H:%M:%S) \r"
        sleep 1
    done
)

# Create backup of a file
bak() {
    mv $1 $1.bak
}

# Replace String in text file
repl() {
    sed -i "s/$2/$3/g" $1
}

# Expand alias on prompt
expand-alias() {
    zle _expand_alias
    zle autosuggest-clear
}
zle -N expand-alias

# Install package with pamac
inst() {
    if [[ -z "$1" ]]; then
        pacseek
    else
        pamac install $@ || echo "Failed."
    fi
}

# Reinstall package with pamac
reinst() {
    pamac reinstall $1
}

# Fix paste being slow because of the highlight plugin
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Get a random number
rand() {
    echo $((1 + ($RANDOM % $1)))
}

# Fuzzy find text in files 
rga-fzf() {
    RG_PREFIX="rga --files-with-matches"
    local file
    file="$(
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
            fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
            --phony -q "$1" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window="70%:wrap"
    )" &&
        echo "opening $file" &&
        xdg-open "$file"
}
