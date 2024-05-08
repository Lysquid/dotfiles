function sway -d "Script to launch Sway"
    set -gx XDG_SESSION_TYPE wayland
    set -gx QT_QPA_PLATFORM wayland
    set -gx SDL_VIDEODRIVER wayland
    set -gx GDK_BACKEND wayland
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx _JAVA_AWT_WM_NONREPARENTING 1

    set -gx XDG_SESSION_DESKTOP sway
    set -gx XDG_CURRENT_DESKTOP sway

    set -gx GTK_THEME Orchis-Dark
    set -gx GTK_IM_MODULE fcitx
    set -gx QT_IM_MODULE fcitx
    set -gx XMODIFIERS @im=fcitx
    # set -gx _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'

    exec sway --unsupported-gpu $argv > /dev/null 2> /dev/null
end
