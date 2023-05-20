#!/bin/zsh

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
alias zshrc="${EDITOR} ${ZDOTDIR:-$HOME}/.zshrc"                                        # Edit dotfiles in $EDITOR
alias ed='code /opt/dotfiles'                                                           # Edit dotfiles in code
alias vd='tmux new-window -c /opt/dotfiles lvim'                                        # Edit dotfiles in lvim

# Command line head / tail shortcuts
# Some taken from: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases
alias -g B='| bat'
alias -g BD='| base64 -d'
alias -g BE='| base64'
alias -g C='| tee >( clip )'
alias -g CA="2>&1 | cat -A"
alias -g CH="| choose"
alias -g G='| rg'
alias -g GV='| rg -v'
alias -g H='| head'
alias -g IP_REGEX="|rg '(\\b25[0-5]|\\b2[0-4][0-9]|\\b[01]?[0-9][0-9]?)(\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}'"
alias -g J='| jq'
alias -g L="| less"
alias -g LL="2>&1 | less"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g S='| sd'
alias -g T='| tail'
alias -g U='| urlencode'
alias -g UD='| urlencode -d'
alias -g W='| wc -l'


# Interactive, verbose file-system operations
alias rm='rip -i'                                                               # Remove to trash with rip (rm improved)
alias cp='xcp -v'                                                              # Copy with progress with xcp
alias mv='mv -v'

# $EDITOR (usually nvim)
alias v="$EDITOR"
alias vi='v'
alias vim='v'
alias edit='v'
alias gedit='subl'

# Package manager
alias u='paru'                                                                  # System Update
alias rem='paru -R'                                                             # Remove a Package
alias rpac='sudo rm /var/lib/pacman/db.lck'                                     # Remove pacman db lock, in case some update has failed/crashed 

# Search and Filter
alias f='locate'                                                                # Locate shortened
alias grep='rg'                                                                 # Better grep
alias locate='plocate'                                                          # Better locate
alias rg='rg --hidden -i'                                                       # Search for text in files, default to hidden
alias sortnr='sort -n -r'                                                       # Sort shortened
alias udb='sudo updatedb'                                                       # Update locate database shortened

# System Administration and Monitoring
alias core='sudo i7z'                                                           # CPU info
alias ctl='sudo systemctl'                                                      # Systemctl shortened
alias du='ncdu'                                                                 # Disk Usage seems way better than 'dust -r'
alias df='lfs'                                                                  # Disk Free Space
alias ex='chmod +x'                                                             # Set executable shortened
alias own='sudo chown $USER:$USER '                                             # Own a File
alias ips="ip -4 addr |awk '{print \$2}' | rg '\.'"                             # Get list of ipv4 addresses
alias j='sudo journalctl -b -p3'                                                # View logs since last boot
alias mp='sudo modprobe '                                                       # Modprobe shortened
alias ps='procs --sortd=cpu --watch-interval=1'                                 # Process monitor shortened
alias sens='watch -d -n.5 sensors'                                              # Sensors
alias st='sudo touch'                                                           # Create a file as root
alias t='tail -f'                                                               # Read file in realtime
alias top='btm'                                                                 # Better top - process manager
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'                   # Update GRUB Configuration
alias w='watch -n 0.5 '                                                         # Run command every 0.5 seconds

# Clipboard
alias cf='copyfile'                                                             # Copy file content to clipboard
alias clip='xargs echo -n | cb'                                                 # Copy to clipboard shortened
alias copy='cb copy'                                                            # Copy using clipboard 
alias paste='cb paste'                                                          # Paste using clipboard

# Misc
alias ':q'='exit'                                                               # Force of a habit..
alias bc='qalc'                                                                 # Better calculator than bc
alias c='cat'                                                                   # Cat shortened
alias cc='bat'                                                                  # Cat with colors
alias comp='compdef _gnu_generic '                                              # Generate completions for command
alias e='echo'                                                                  # Echo shortened
alias en='echo -n'                                                              # Echo without trailing new-line
alias efi='efibootmgr'                                                          # efiboormgr shortened
alias gs="echo It\'s \'gst\' for \'git status\'"
alias less='bat'                                                                # Better less
alias lfp='fd -d 1 -a -H'                                                       # Show full path of files in directory
alias lg='lazygit'
alias msgbox='kdialog --msgbox '                                                # Spawn a message-box
alias myip='curl http://ipecho.net/plain; echo'                                 # Get Public IP Address 
alias r='ranger'                                                                # Ranger File-Manager
alias send2phone='kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --ping-msg ' # Send to phone with kde connect
alias screen_off='xset dpms force off'
alias serv='miniserve'                                                          # HTTP file-server
alias tmp='take /tmp/$RANDOM'                                                   # Create temporary directory with random name

# CPU performance profiles 
alias performance='sudo sh -c "echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"'
alias powersave='sudo sh -c "echo powersave | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"'

# systemd
alias s='sudo systemctl status '
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

alias uenable='systemctl --user enable '
alias udisable='systemctl --user disable '

alias mask='sudo systemctl mask '
alias unmask='sudo systemctl unmask '

alias reboot='sudo reboot -f'
alias poweroff='sudo poweroff -f'

