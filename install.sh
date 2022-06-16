#!/bin/bash

### should create links instead of copying so it's easier to update
read "This Will overwrite your files. are you sure?[y/N]"
if [[ $answer =~ ^[Yy]$ ]]; then
    mkdir -p ~/.config/zsh
    cp .zlogin .zprofile .zshrc functions.zsh pentest.zsh aliases.zsh ~/.config/zsh
    cp starship.toml ~/.config/
    cp -r lvim ~/.config/
fi
