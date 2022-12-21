# If running from tty1 start sway

if test (tty) = /dev/tty1

    set -gx QT_QPA_PLATFORMTHEME qt5ct
    set -gx GTK_THEME Orchis-Dark
    set -gx _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'
    set -gx GTK_IM_MODULE fcitx
    set -gx QT_IM_MODULE fcitx
    set -gx XMODIFIERS @im=fcitx
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
    set -gx QT_QPA_PLATFORM wayland
    set -gx XDG_CURRENT_DESKTOP sway
    set -gx XDG_SESSION_DESKTOP swayset
    set -gx XDG_SESSION_TYPE wayland
    set -gx GDK_BACKEND wayland
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx BEMENU_BACKEND wayland

    exec sway --unsupported-gpu > /dev/null 2> /dev/null
end