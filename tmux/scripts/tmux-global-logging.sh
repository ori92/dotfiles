#!/bin/bash

if [ -n "$TMUX_PANE" ] && [ "$TMUX_PANE_LOGGING" != "1" ]; then
  export TMUX_PANE_LOGGING=1
else
  exit 0
fi

LOGS=$HOME/.config/tmux/logs
LOG_PATH="$LOGS/$(date +%Y-%m-%d-%H:%M:%S).pane${TMUX_PANE//[^0-9]/}.log"

tmux pipe-pane -t "${TMUX_PANE}" "exec cat - >> $LOG_PATH"
