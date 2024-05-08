# Fish
set fish_greeting
set -g fish_function_path $fish_function_path ~/.config/fish/functions/custom
set sponge_delay 10

# Applications
set -gx BROWSER firefox
set -gx EDITOR nvim
set -gx OPENER mimeopen

# Tweaks
set -gx MANPAGER 'less -R --use-color -Dd+r -Du+b'
set -gx LESS '-R --use-color -Dd+r$Du+b'
set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml 
set -gx GTK2_RC_FILES ~/.config/gtk-2.0/gtkrc
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

# Path
set -gx PATH $PATH $HOME/.local/bin
