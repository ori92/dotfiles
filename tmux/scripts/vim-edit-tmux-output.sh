#!/bin/bash

# $HOME/bin/vim-edit-tmux-output.sh

file=`mktemp`.sh
tmux capture-pane -pS -32768 > $file
tmux new-window -n:mywindow "vim '+ normal G $' $file"
