#!/bin/zsh

# Disable less history file
export LESSHISTFILE=-

export SSH_ASKPASS='/usr/bin/ksshaskpass'

export ZSH_COMPDUMP="/home/ori/.config/zsh/.zcompdump"

zcd_compile() {
  # Compile zcompdump, if modified, to increase startup speed.
  if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
    zcompile "$ZSH_COMPDUMP"
  fi
}
zcd_compile
