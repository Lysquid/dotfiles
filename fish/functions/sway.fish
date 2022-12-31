# Script to launch Sway

function sway
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
    set -gx QT_QPA_PLATFORM wayland
    set -gx XDG_CURRENT_DESKTOP sway
    set -gx XDG_SESSION_DESKTOP sway
    set -gx XDG_SESSION_TYPE wayland
    set -gx GDK_BACKEND wayland
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx BEMENU_BACKEND wayland
    exec sway --unsupported-gpu $argv > /dev/null 2> /dev/null
end
