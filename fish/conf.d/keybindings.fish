# lfcd
bind \cg 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint' 
# Edit
bind \cy '$EDITOR' 
# Background job
bind \cz 'fg > /dev/null 2> /dev/null'