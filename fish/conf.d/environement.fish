# Applications
set -gx BROWSER firefox
set -gx EDITOR nvim
set -gx OPENER mimeopen

# Tweaks
set -gx MANPAGER 'less -R --use-color -Dd+r -Du+b'
set -gx LESS '-R --use-color -Dd+r$Du+b'
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx GTK_THEME Orchis-Dark
set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
set -gx GTK2_RC_FILES ~/.config/gtk-2.0/gtkrc
# set -gx _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'

# Input
set -gx GTK_IM_MODULE fcitx
set -gx QT_IM_MODULE fcitx
set -gx XMODIFIERS @im=fcitx

# Path
set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH $HOME/.config/bin
set -g fish_function_path $fish_function_path ~/.config/fish/functions/custom

# Plugins
set sponge_delay 10
