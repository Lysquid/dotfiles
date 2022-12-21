# Environnement variables
set -gx BROWSER firefox
set -gx TERM alacritty
set -gx TERMINAL alacritty -e
set -gx EDITOR nvim
set -gx LESS '-R --use-color -Dd+r$Du+b'
set -gx MANPAGER 'less -R --use-color -Dd+r -Du+b'
set -gx OPENER mimeopen

# Path
set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH $HOME/.config/bin