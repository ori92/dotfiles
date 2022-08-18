#! /bin/zsh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}
kind=${mime##*/}

[ -z "$1" ] && exit

if [ -d "$1" ]; then
    exa --git -hl --color=always --icons "$1"
elif [ "$category" = image ]; then
    viu -h 30 -w 30 "$1"
    exiftool "$1"
elif [ "$category" = text ]; then
    bat --color=always "$1" | head -n 250
else
    file "$1"
fi
