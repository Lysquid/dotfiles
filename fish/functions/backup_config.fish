# Backup all config files that are not in .config

function backup_config
    pacman -Qq > ~/.config/arch/pacman-Qq.txt
    pacman -Qqe > ~/.config/arch/pacman-Qqe.txt
    pacman -Qqm > ~/.config/arch/pacman-Qqm.txt

    # systemd unit files
    systemctl list-unit-files --state=enabled > ~/.config/arch/systemctl-enabled.txt
    systemctl list-unit-files > ~/.config/arch/systemctl.txt

    # edited etc files
    rsync --relative \
    /etc/fstab \
    /etc/pacman.conf \
    /etc/X11/xorg.conf.d/** \
    /etc/default/grub \
    /etc/environment \
    /etc/hostname \
    /etc/locale.conf \
    /etc/locale.gen \
    /etc/xdg/reflector/reflector.conf \
    /etc/lightdm/lightdm.conf \
    /etc/lightdm/lightdm-gtk-greeter.conf \
    /etc/libvirt/libvirtd.conf \
    /etc/libvirt/qemu.conf \
    /etc/greetd/** \
    .config/
end