#!/bin/zsh

export no_color='\033[0m'
export black='\033[0;30m'
export dgray='\033[1;30m'
export red='\033[0;31m'
export lred='\033[1;31m'
export green='\033[0;32m'
export lgreen='\033[1;32m'
export orange='\033[0;33m'
export yellow='\033[1;33m'
export blue='\033[0;34m'
export lblue='\033[1;34m'
export purple='\033[0;35m'
export lpurple='\033[1;35m'
export cyan='\033[0;36m'
export lcyan='\033[1;36m'
export lgray='\033[0;37m'
export white='\033[1;37m'

# list of colors for easy echo
export colors='no_color black dgray red lred green lgreen orange yellow blue lblue purple lpurple cyan lcyan lgray white'

if [[ $- == *i* ]]; then
  export bold=$(tput bold)
fi
