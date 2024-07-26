# Applications
set -gx BROWSER firefox
set -gx EDITOR nvim

# Tweaks
set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml 
set -gx GTK2_RC_FILES ~/.config/gtk-2.0/gtkrc
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

# Colors
set -gx MANPAGER 'less -R --use-color -Dd+r -Du+b'
set -gx MANROFFOPT '-P -c'
set -gx LESS '-R --use-color -Dd+r$Du+b'

# Path
set -gx PATH $PATH $HOME/.local/bin
