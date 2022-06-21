#!/bin/bash

### should create links instead of copying so it's easier to update
read "This Will overwrite your files. are you sure?[y/N]"
if [[ $answer =~ ^[Yy]$ ]]; then
    mkdir -p $XDG_CONFIG_HOME/zsh
    cp .zlogin .zprofile .zshrc functions.zsh pentest.zsh aliases.zsh $XDG_CONFIG_HOME/zsh
    cp starship.toml $XDG_CONFIG_HOME/
    cp -r lvim $XDG_CONFIG_HOME/
fi
