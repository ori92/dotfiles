#!/bin/zsh

# * Installation script was tested on a vanilla Manjaro linux.

# for readability
X=${XDG_CONFIG_HOME-$HOME/.config}

# colors
n='\033[0m'    # normal
r='\033[0;31m' # red
g='\033[0;32m' # green

echo "${g}-->Installing dependencies..${n}"
sudo pacman -S tmux git neovim starship xclip fzf exa zoxide lsd ncdu procs ranger bpytop fd plocate ripgrep macchina

echo "${g}-->Creating backups...${n}"
files=("$HOME/.zshrc" "$HOME/.zshenv" "$X/zsh" "$X/tmux" "$X/starship.toml" "$X/astronvim/" "$X/nvim")
for f in $files; do
    [ -d "$f" ] && mv $f{,.bak} && echo "${g}${f}-->${f}.bak${n}"
done
echo "${g}-->Creating directories...${n}"
mkdir -p "$X/zsh" "$X/tmux" "$X/astronvim/lua/user"

echo "${g}Installing oh-my-zsh..${n}"
echo "${r}-->Please exit zsh by typing 'exit' after omz installation is finished in order to complete this installation process.${n}"
read "?ENTER to continue with installation."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv "$HOME/.oh-my-zsh" "$X/"

echo "${g}-->Installing oh-my-zsh plugins..${n}"
P=$X/.oh-my-zsh/custom/plugins
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $P/autoupdate
git clone https://github.com/MichaelAquilina/zsh-you-should-use $P/you-should-use
git clone https://github.com/zsh-users/zsh-autosuggestions $P/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab $P/fzf-tab
git clone https://github.com/hlissner/zsh-autopair $P/zsh-autopair
git clone https://github.com/zsh-users/zsh-syntax-highlighting $P/zsh-syntax-highlighting

# remove the newly created .zshrc
rm $HOME/.zshrc

echo "${g}-->Installing zsh rc files..${n}"
ln zsh/.zlogin zsh/profile.zsh zsh/.zshrc zsh/functions.zsh zsh/pentest.zsh zsh/aliases.zsh zsh/filetype.zsh zsh/colors.zsh "$X/zsh/"
ln zsh/.zshenv $HOME/

echo "${g}-->Installing tmux rc files..${n}"
ln tmux/tmux.conf tmux/remote.conf tmux/theme.conf "$X/tmux/"
ln -s $(pwd)/tmux/scripts "$X/tmux/"
echo "${g}-->Installing tmux-plugin manager..${n}"
echo "${r}Remember to press prefix(C-b)+I to install plugins after you first run tmux.${n}"
git clone https://github.com/tmux-plugins/tpm "$X/tmux/plugins/tpm"

echo "${g}-->Installing starship rc files..${n}"
ln starship/starship.toml "$X/"

echo "${g}-->Installing AstroNvim..${n}"
git clone https://github.com/AstroNvim/AstroNvim "$X/nvim"
echo "-->Installing astronvim rc files..${n}"
git clone https://github.com/ori92/astronvim_config astronvim
ln -sf $(pwd)/astronvim "$X/astronvim/lua/user"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "${g}-->Done. Have fun!!${n}"
