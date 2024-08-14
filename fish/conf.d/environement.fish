# Applications
set -gx BROWSER firefox
set -gx EDITOR nvim

# Colors
set -gx MANPAGER 'less -R --use-color -Dd+r -Du+b'
set -gx MANROFFOPT '-P -c'
set -gx LESS '-R --use-color -Dd+r$Du+b'

# Tweaks
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

# Path
set -gx PATH $PATH $HOME/.local/bin
