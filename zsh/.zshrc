#!/bin/zsh

macchina --theme ori # Pretty startup :)

setopt noclobber
setopt appendcreate
setopt extendedglob
setopt dotglob

plugins=(
    autoupdate copybuffer copyfile copypath
    docker extract fast-syntax-highlighting fzf fzf-tab
    git kubectl sudo web-search you-should-use
    zsh-autopair zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/profile.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/colors.zsh
source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/filetype.zsh
source $ZDOTDIR/pentest.zsh          # Penetration testing
source $ZDOTDIR/analysis.bash        # Analysis functions: github.com/bahamas10/bash-analysis

bindkey '^s' fzf-file-widget
bindkey '^x' expand-alias

eval "$(/usr/bin/navi widget zsh)"   # navi
eval "$(/usr/bin/zoxide init zsh)"   # zoxide
eval "$(/usr/bin/starship init zsh)" # starship-prompt

$HOME/.config/tmux/scripts/tmux-global-logging.sh # Log all tmux output

# Start the sensors service for monitoring CPU/GPU/RAM usage and temperatures
 /usr/bin/pgrep -f "$XDG_CONFIG_HOME/tmux/scripts/tmux_sensors.sh" &> /dev/null \
   || /bin/zsh -c  "$XDG_CONFIG_HOME/tmux/scripts/tmux_sensors.sh  &> /dev/null &"

# Start the weather service for monitoring current weather
/usr/bin/pgrep -f "$XDG_CONFIG_HOME/tmux/scripts/weather.sh" &>/dev/null \
  || /bin/zsh -c  "$XDG_CONFIG_HOME/tmux/scripts/weather.sh  &>/dev/null &"
