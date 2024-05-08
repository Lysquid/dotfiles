function backup_config -d "Backup system configuration"
    # installed softwares
    pacman -Qq > ~/.config/arch/pacman-all.txt
    pacman -Qqe > ~/.config/arch/pacman-explicit.txt
    pacman -Qqem > ~/.config/arch/pacman-aur.txt
    # pipx
    pipx list --short > ~/.config/arch/pipx.txt
    # vscode extensions
    code --list-extensions > ~/.config/arch/code-extensions.txt

    # systemd unit files
    systemctl list-unit-files --state=enabled > ~/.config/arch/systemctl-enabled.txt

    # edited files not in .config
    rsync --relative \
    /etc/fstab \
    /etc/pacman.conf \
    /etc/default/grub \
    /etc/environment \
    /etc/hostname \
    /etc/locale.conf \
    /etc/locale.gen \
    /etc/xdg/reflector/reflector.conf \
    /etc/libvirt/libvirtd.conf \
    /etc/libvirt/qemu.conf \
    /etc/greetd/config.toml \
    /etc/udev/rules.d/9*.rules \
    /etc/ssh/sshd_config \
    .config/
end
