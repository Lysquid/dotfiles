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
alias rm='rm -I'
alias ip='ip -color=auto'
alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias tra='gio trash'
alias trr='gio trash --restore'
alias trl='gio trash --list'
alias reload='source .config/fish/config.fish'
alias backup_to_disk='rsync -aPht --delete --delete-excluded --exclude-from=/home/rom1/.config/rsync/exclude_list.txt /etc /home /run/media/rom1/Backup\ Disk/arch'
alias pico8='~/.local/share/pico8/pico8'

# Functions

function keylog
    xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
end

function brightness
    xrandr --output HDMI2 --brightness (math $argv/10)
end

function eject
    sudo umount $argv
    sleep 1
    udisksctl power-off -b $argv
end

function drive_sync
    rclone sync ~/ drive:Laptop --filter-from .config/rclone/filter.txt --skip-links --delete-excluded
end

# Starship
starship init fish | source