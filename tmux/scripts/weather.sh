#!/usr/bin/env bash

UPDATE_INTERVAL=1800  # 30 minutes
LOCATION_FILE=~/.config/tmux/location.txt

while true; do
    weather=$(curl -s "wttr.in/$(<"$LOCATION_FILE")?format=%c%t")
    tmux set -gq @weather "$weather"
    sleep "$UPDATE_INTERVAL"
done