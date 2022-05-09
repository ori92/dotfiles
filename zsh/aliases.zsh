#!/bin/zsh

# Modified aliases from common-aliases plugin.
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases

#enabaling alias after sude i.e. 'sudo ll'
alias sudo='sudo '

# ls - the common ones I use a lot, shortened for rapid fire usage
alias ls='exa'
alias l='exa -a --icons --group-directories-first'                                      #size,show type,human readable
alias lr='exa -laR --icons --links --sort=date --color-scale --group-directories-first' #sorted by date,recursive,show type,human readable
alias lt='exa -la --icons --links --sort=date --color-scale --group-directories-first'  #long list,sorted by date,show type,human readable
alias ll='exa -la --icons --links --group-directories-first'                            #long list
alias ldot='exa -la --icons .* --links --group-directories-first'                       #show only dot files
alias lS='lsd --total-size -l --sort=size'                                              #show folder total size

alias nvim=lvim
alias zshrc="${EDITOR} ${ZDOTDIR:-$HOME}/.zshrc" # Quick access to the .zshrc file
# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias du='dust -r'
alias p='procs --sortd=cpu --watch-interval=1'
alias sortnr='sort -n -r'

alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -v'

# mv and cp using rsyng with progress
alias rcp='rsync -aP'
alias rmv='rsync -aP --remove-source-files'

# vim is now a function (functions.zsh)
alias vi='v'
alias vim='v'
alias edit='v'
alias gedit='subl'

# Package manager
alias updt='pamac upgrade'
alias u='updt'
alias rem='sudo pacman -R'
alias rpac='sudo rm /var/lib/pacman/db.lck'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

#otp
alias otp="cat $HOME/creds/otp| base32 -d | totp set test/totp |tee >( clip )"

alias t='tail -f'
alias w='watch -n 0.5 '
alias cf='copyfile'
alias st='sudo touch'
alias e='echo'
alias en='echo -n'
alias c='cat'
alias cc='ccat'
alias j='sudo journalctl -b -p3'
alias less='cless'
alias edot='code $HOME/Projects/dotfiles'
alias vdot='tmux new-window -c $HOME/Projects/dotfiles lvim'
alias locate='plocate'
alias r='ranger'
alias f='locate'
alias sens='watch -d -n.5 sensors' #Sensors
alias core='sudo i7z'              #CPU info

alias mp='sudo modprobe '
alias serv='sudo python -m http.server'
alias ex='chmod +x'
alias ctl='sudo systemctl'
alias top='bpytop'
alias clip='xargs echo -n | xclip -selection clipboard'
alias msgbox='kdialog --msgbox '
alias grep='rg -i'
alias m='math'
alias fz='z `z| fzf`'
alias lfp='fd -d 1 -a -H' # Show full path of files in directory.
alias udb='sudo updatedb'
alias send_to_phone='kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --ping-msg '
alias comp='compdef _gnu_generic ' # Generate completions for command

# Git
alias gc='git clone'
alias gp='git pull'
alias gs='git status'

alias fu='funky'
alias gfu='gfunky'

alias performance='sudo sh -c "echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"'
alias powersave='sudo sh -c "echo powersave | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"'

alias -g W='|wc -l'
alias -g S='|sed'
alias -g C='|tee >( clip )'
alias -g J='|jq'
alias -g GV='|rg -v'
alias -g A='|awk'
alias -g A1="|awk '{print \$1}'"
alias -g A2="|awk '{print \$2}'"
alias -g A3="|awk '{print \$3}'"
alias -g A4="|awk '{print \$4}'"
alias -g A5="|awk '{print \$5}'"
alias -g A.1="|awk -F. '{print \$1}'"
alias -g A.2="|awk -F. '{print \$2}'"
alias -g A.3="|awk -F. '{print \$3}'"
alias -g A.4="|awk -F. '{print \$4}'"
alias -g A.5="|awk -F. '{print \$5}'"
alias -g A,1="|awk -F, '{print \$1}'"
alias -g A,2="|awk -F, '{print \$2}'"
alias -g A,3="|awk -F, '{print \$3}'"
alias -g A,4="|awk -F, '{print \$4}'"
alias -g A,5="|awk -F, '{print \$5}'"

# open browser on urls
_browser_fts=(htm html de org net com at cx nl se dk)
for ft in $_browser_fts; do alias -s $ft="$BROWSER"; done

# open text files in editor
_editor_fts=(js md MD cpp cxx cc c hh h inl asc txt TXT tex)
for ft in $_editor_fts; do alias -s $ft="$EDITOR"; done

# open images in viewer
_image_fts=(jpg jpeg png gif mng tiff tif xpm)
for ft in $_image_fts; do alias -s $ft="$XIVIEWER"; done

# open video on smplayer
_media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
for ft in $_media_fts; do alias -s $ft=smplayer; done

#read documents
alias -s pdf='okular'
alias -s ps='gv'
alias -s dvi='xdvi'
alias -s chm='xchm'
alias -s djvu='djview'

#list whats inside packed file
alias -s zip='unzip -l'
alias -s rar='unrar l'
alias -s tar='tar tf'
alias -s gz='gunzip -l'

#systemd
alias s='systemctl status '
alias us='systemctl --user status '
alias status='sudo systemctl status'

alias start='sudo systemctl start '
alias stop='sudo systemctl stop '
alias restart='sudo systemctl restart '

alias ustart='systemctl --user start '
alias ustop='systemctl --user stop '
alias urestart='systemctl --user restart '

alias enable='sudo systemctl enable '
alias disable='sudo systemctl disable '

alias nuenable='systemctl --user enable --now '
alias nudisable='systemctl --user disable --now '
alias uenable='systemctl --user enable '
alias udisable='systemctl --user disable '

alias nenable='sudo systemctl enable --now '
alias ndisable='sudo systemctl disable --now '

alias mask='sudo systemctl mask '
alias umask='sudo systemctl unmask '

alias U='start '
alias D='stop '
alias R='restart '
alias E='enable '
alias DI='disable '

alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'

alias ':q'='exit' # Force of habbit

#Colors
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

#list of colors for easy echo
export colors='no_color black dgray red lred green lgreen orange yellow blue lblue purple lpurple cyan lcyan lgray white'

if [[ $- == *i* ]]; then
  export bold=$(tput bold)
fi
