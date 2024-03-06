#!/bin/zsh

# Edit tmux output with vim
vim-edit-output() {
    file=$(mktemp).sh
    tmux capture-pane -pS -32768 >$file
    tmux new-window -n:mywindow "lvim '+ normal G $' $file"
}

# Timer (count seconds)
stimer() {
    seconds=$(($1))
    date1=$(($(date +%s) + $seconds))
    while [ "$date1" -ge $(date +%s) ]; do
        echo -ne "$(date -u --date @$(($date1 - $(date +%s))) +%H:%M:%S)\r"
        sleep .5
    done
    notify-send "$2"
    paplay ~/Documents/notification.wav
    kdialog --title "Timer Ran Out!" --msgbox "$2"
}

# Timer wrapper for counting minutes  
timer() {
    [[ "$#" -ne 2 ]] && echo "Usage: timer [minutes] [message]" && exit
    stimer $((60 * $1)) $2
}

# Counter
count() {
    SECONDS=0
    while [ true ]; do
        echo -ne "$(date -d@"$SECONDS" -u +%H:%M:%S) \r"
        sleep 1
    done
}

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

# Install package with paru
inst() {
    if [[ -z "$1" ]]; then
        pacseek
    else
         paru $@ || echo "Failed."
    fi
}

# Fix paste being slow because of the highlight plugin
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Random number
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

# Print With Python
pp() {
    python -c "print ($*)"
}

# Define global tmux variable
glob() {
    if [[ "$#" -ne 2 ]]
    then
        echo "Define global tmux variable. Usage: glob [var_name] [value]"
    else
        tmux set-environment $1 $2
        export $1=$2
    fi
}