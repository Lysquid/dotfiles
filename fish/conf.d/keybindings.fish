bind \cg 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint' 
bind \cy '$EDITOR' 
bind \cz 'fg > /dev/null 2> /dev/null'