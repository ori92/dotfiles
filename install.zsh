#!/bin/zsh

# Installation script was tested on a vanilla Manjaro linux,
# TODO make it more readable, some more tests..

[ -n "$XDG_CONFIG_HOME" ] || {
    echo -e "${red}\$XDG_CONFIG_HOME is undefined, setting it to ~/.config"
    export XDG_CONFIG_HOME="$HOME/.config"
}

export no_color='\033[0m'
export red='\033[0;31m'
export green='\033[0;32m'

read "answer?Are you sure? [y/N]"
if [[ $answer =~ ^[Yy]$ ]]; then

    echo -e "${green}->installing dependencies.."
    sudo pacman -S tmux git neovim starship xclip fzf exa zoxide lsd dust procs ranger bpytop fd plocate ripgrep neofetch

    echo -e "${green}->Creating backups..."
    [ -d "$XDG_CONFIG_HOME/zsh" ] && mv $XDG_CONFIG_HOME/zsh{,.bak} && echo -e "->$XDG_CONFIG_HOME/zsh.bak."
    [ -d "$HOME/.zshrc" ] && mv $HOME/.zshrc{,.bak} && echo -e "->$HOME/.zshrc.bak."
    [ -d "$HOME/.zshenv" ] && mv $HOME/.zshenv{,.bak} && echo -e "->$HOME/.zshenv.bak."
    [ -d "$XDG_CONFIG_HOME/zsh" ] && mv $XDG_CONFIG_HOME/zsh{,.bak} && echo -e "->$XDG_CONFIG_HOME/zsh.bak."
    [ -d "$XDG_CONFIG_HOME/zsh" ] && mv $XDG_CONFIG_HOME/zsh{,.bak} && echo -e "->$XDG_CONFIG_HOME/zsh.bak."
    [ -d "$XDG_CONFIG_HOME/tmux" ] && mv $XDG_CONFIG_HOME/tmux{,.bak} && echo -e "->$XDG_CONFIG_HOME/tmux.bak."
    [ -d "$XDG_CONFIG_HOME/starship.toml" ] && mv $XDG_CONFIG_HOME/starship.toml{,.bak} && echo -e "->$XDG_CONFIG_HOME/starship.toml"
    [ -d "$XDG_CONFIG_HOME/astronvim/" ] && mv $XDG_CONFIG_HOME/astronvim/{,.bak} && echo -e "->$XDG_CONFIG_HOME/astronvim.bak."
    echo -e "${green}->Done."

    read "answer?Install oh-my-zsh? [y/N]"
    if [[ $answer =~ ^[Yy]$ ]]; then
        echo -e "${green}Installing oh-my-zsh.."
        echo -e "${red}->Please exit zsh by typing 'exit' after omz installation is finished in order to complete this installation process."
        read "?Enter to continue.."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        mv "$HOME/.oh-my-zsh" "$XDG_CONFIG_HOME/.oh-my-zsh"

        echo -e "${green}Installing oh-my-zsh plugins.."
        export ZSH_CUSTOM=$XDG_CONFIG_HOME/.oh-my-zsh/custom
        git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
        git clone https://github.com/MichaelAquilina/zsh-you-should-use $ZSH_CUSTOM/plugins/you-should-use
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
        git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
        git clone https://github.com/hlissner/zsh-autopair $ZSH_CUSTOM/plugins/zsh-autopair
        git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    fi

    echo -e "${green}Installing zsh rc files.."
    mkdir -p "$XDG_CONFIG_HOME/zsh"
    ln zsh/.zlogin zsh/profile.zsh zsh/.zshrc zsh/functions.zsh zsh/pentest.zsh zsh/aliases.zsh zsh/filetype.zsh zsh/colors.zsh "$XDG_CONFIG_HOME/zsh/"
    ln zsh/.zshenv $HOME/

    echo -e "${green}Installing tmux rc files.."
    mkdir -p "$XDG_CONFIG_HOME/tmux"
    ln tmux/tmux.conf tmux/tmux.remote.conf tmux/tmux.appearance.conf "$XDG_CONFIG_HOME/tmux/"
    ln -s $(pwd)/tmux/scripts "$XDG_CONFIG_HOME/tmux/"
    echo -e "${green}Installing tmux-plugin manager.."
    echo -e "${red}Remember to press prefix(C-b)+I to install plugins after you first run tmux."
    read "?Enter to continue.."
    git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"

    echo -e "${green}Installing starship rc files.."
    ln starship/starship.toml "$XDG_CONFIG_HOME/"

    read "answer?install astronvim? [y/N]"
    if [[ $answer =~ ^[Yy]$ ]]; then
        echo -e "${green}Installing oh-my-zsh.."
        git clone https://github.com/AstroNvim/AstroNvim "$XDG_CONFIG_HOME/nvim"
        echo -e "${red}Exit vim with :q after packer has finished to install the plugins.."
        read "?Enter to continue.."
        nvim +PackerSync
    fi

    echo -e "Installing astronvim rc files.."
    mkdir -p "$XDG_CONFIG_HOME/astronvim/lua/user"
    git clone https://github.com/ori92/astronvim_config astronvim
    ln -sf $(pwd)/astronvim "$XDG_CONFIG_HOME/astronvim/lua/user"
    echo -e "${red}Exit vim with :q after packer has finished to install the plugins.."
    read "?Enter to continue.."
    nvim +PackerSync

    echo -e "${green}Done. Have fun!!"
fi
echo -e "Exiting."
