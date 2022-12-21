# Applications
set -gx BROWSER firefox
set -gx TERM alacritty
set -gx EDITOR nvim
set -gx OPENER mimeopen

# Tweaks
set -gx MANPAGER 'less -R --use-color -Dd+r -Du+b'
set -gx LESS '-R --use-color -Dd+r$Du+b'
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx GTK_THEME Orchis-Dark
set -gx _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'

# Input
set -gx GTK_IM_MODULE fcitx
set -gx QT_IM_MODULE fcitx
set -gx XMODIFIERS @im=fcitx

# Path
set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH $HOME/.config/bin