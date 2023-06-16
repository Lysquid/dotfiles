# lfcd
bind \cg 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint' 

# Background job
bind \cz 'fg > /dev/null 2> /dev/null'

# Ctrl+backspace
bind \cH backward-kill-word
bind \e\[127\;5u backward-kill-word # vim terminal

# Ctrl+del
bind \e\[3\;5~ kill-word
