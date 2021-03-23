#!/bin/zsh

export SSH_ASKPASS='/usr/bin/ksshaskpass'

export ZSH_COMPDUMP="/home/ori/.config/zsh/.zcompdump"
# Execute code in the background to not affect the current session
{
  # Compile zcompdump, if modified, to increase startup speed.
  zcompdump="$ZSH_COMPDUMP"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!