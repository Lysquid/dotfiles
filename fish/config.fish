# Default
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Fish shell for root user when switching with su
function su
   command su --shell=/usr/bin/fish $argv
end

# Remove 'Welcome to fish' message
set fish_greeting

# Environnement variables
set -gx BROWSER firefox
set -gx TERM alacritty
set -gx LESS '-R --use-color -Dd+r$Du+b'
set -gx MANPAGER 'less -R --use-color -Dd+r -Du+b'
set -gx GTK_IM_MODULE fcitx
set -gx QT_IM_MODULE fcitx
set -gx XMODIFIERS @im=fcitx

# Path
set -gx PATH $PATH $HOME/bin
set -gx PATH $PATH $HOME/.local/bin

# Alias
alias ip='ip -color=auto'
alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias tra='gio trash'
alias trr='gio trash --restore'
alias trl='gio trash --list'
alias reload='source .config/fish/config.fish'
alias backup='rsync -aPh --delete --delete-excluded --exclude-from=/home/rom1/.config/rsync/exclude_list.txt /etc /home /run/media/rom1/Disk\ Romain/Backups/arch'

function brightness
    command xrandr --output HDMI2 --brightness (math $argv/10)
end
