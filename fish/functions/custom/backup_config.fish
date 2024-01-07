function backup_config -d "Backup system configuration"
    # installed softwares
    pacman -Qq > ~/.config/arch/pacman-Qq.txt
    pacman -Qqe > ~/.config/arch/pacman-Qqe.txt
    pacman -Qqem > ~/.config/arch/pacman-Qqem.txt
    pipx list --short > ~/.config/arch/pipx.txt

    # systemd unit files
    systemctl list-unit-files --state=enabled > ~/.config/arch/systemctl-enabled.txt
    systemctl list-unit-files > ~/.config/arch/systemctl.txt

    # edited files not in .config
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
    /etc/libvirt/libvirtd.conf \
    /etc/libvirt/qemu.conf \
    /etc/greetd/config.toml \
    .config/
end
