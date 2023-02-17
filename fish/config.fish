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

# Starship
# starship init fish | source
