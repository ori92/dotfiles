#!/bin/zsh

# Heavily modified aliases from common-aliases plugin.
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases

# Enabling alias after sudo i.e. 'sudo ll'
alias sudo='sudo '

# ls - the common ones I use a lot, shortened for rapid fire
alias ls='exa'
alias l='exa -a --icons --group-directories-first'                                      # size,show type,human readable
alias lr='exa -laR --icons --links --sort=date --color-scale --group-directories-first' # sorted by date,recursive,show type,human readable
alias lt='exa -la --icons --links --sort=date --color-scale --group-directories-first'  # long list,sorted by date,show type,human readable
alias ll='exa -la --icons --links --group-directories-first'                            # long list
alias ldot='exa -la --icons .* --links --group-directories-first'                       # show only dot files
alias lS='lsd --total-size -l --sort=size'                                              # show folder total size

# Quick access to the .zshrc file
alias zshrc="${EDITOR} ${ZDOTDIR:-$HOME}/.zshrc"

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
alias -g A-1="|awk -F- '{print \$1}'"
alias -g A-2="|awk -F- '{print \$2}'"
alias -g A-3="|awk -F- '{print \$3}'"
alias -g A-4="|awk -F- '{print \$4}'"
alias -g A-5="|awk -F- '{print \$5}'"

# Interactive, verbose file-system operations
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -v'

# Copy and Move via rsync with progress
alias rcp='rsync -aP'
alias rmv='rsync -aP --remove-source-files'

# $EDITOR (usually nvim)
alias v="$EDITOR"
alias vi='v'
alias vim='v'
alias edit='v'
alias gedit='subl'

# Package manager
alias updt='yay -Syu'
alias u='updt'
alias rem='sudo pacman -R'
alias rpac='sudo rm /var/lib/pacman/db.lck'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias t='tail -f'                                                               # Read file in realtime
alias w='watch -n 0.5 '                                                         # Run command every 0.5 seconds
alias cf='copyfile'                                                             # Copy file content to clipboard
alias st='sudo touch'                                                           # Create a file as root
alias e='echo'                                                                  # Echo shortened
alias en='echo -n'                                                              # Echo without trailing new-line
alias c='cat'                                                                   # Cat shortened
alias cc='ccat'                                                                 # Cat with colors
alias j='sudo journalctl -b -p3'                                                # View logs since last boot
alias less='cless'                                                              # Better less
alias edot='code $HOME/Projects/dotfiles'                                       # Edit dotfiles in code
alias vdot='tmux new-window -c /opt/DotFiles nvim'                              # Edit dotfiles in nvim
alias locate='plocate'                                                          # Better locate
alias f='locate'                                                                # Locate shortened
alias r='ranger'                                                                # Ranger shortened
alias sens='watch -d -n.5 sensors'                                              # Sensors
alias core='sudo i7z'                                                           # CPU info
alias ag='ag --hidden'                                                          # Grep for developers, default to hidden
alias vifm='vifmrun'                                                            # Vifm with images preview
alias mp='sudo modprobe '                                                       # Modprobe shortened
alias serv='sudo python -m http.server'                                         # Python http file-server.
alias ex='chmod +x'                                                             # Set executable shortened
alias ctl='sudo systemctl'                                                      # Systemctl shortened
alias top='bpytop'                                                              # Better top - process manager
alias clip='xargs echo -n | xclip -selection clipboard'                         # Copy to clipboard shortened
alias msgbox='kdialog --msgbox '                                                # Spawn a message-box
alias grep='rg -i'                                                              # Better grep
alias m='math'                                                                  # math shortened
alias fz='z `z| fzf`'                                                           # List z-directory in fzf
alias lfp='fd -d 1 -a -H'                                                       # Show full path of files in directory.
alias udb='sudo updatedb'                                                       # Update locate database shortened
alias send2phone='kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --ping-msg ' # Send to phone with kde connect
alias comp='compdef _gnu_generic '                                              # Generate completions for command
alias ':q'='exit'                                                               # Force of a habit..
alias du='ncdu'                                                                 # Seems way better than 'dust -r'
alias p='procs --sortd=cpu --watch-interval=1'                                  # Process monitor shortened
alias sortnr='sort -n -r'                                                       # Sort shortened

# Performance
alias performance='sudo sh -c "echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"'
alias powersave='sudo sh -c "echo powersave | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"'

# Git
alias gc='git clone'
alias gp='git pull'
alias gs='git status'
alias gd='git diff'

# systemd
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
