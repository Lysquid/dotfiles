function backup_config -d "Backup system configuration"
    
    set apps ~/.config/apps
    rm -rf ~/.config/etc

    # pacman
    pacman -Qqem > $apps/pacman-aur.txt
    pacman -Qqe | rg -vxf $apps/pacman-aur.txt > $apps/pacman-explicit.txt
    comm -13 (pacman -Qqdt | sort | psub) (pacman -Qqdtt | sort | psub) > $apps/pacman-optdeps.txt

    # pipx (can't remove version numbers)
    pipx list --short > $apps/pipx.txt

    # vscode extensions
    code --list-extensions > $apps/code-extensions.txt

    # systemd unit files
    systemctl list-unit-files --state=enabled > $apps/systemd-units.txt

    # systemd user unit files
    systemctl list-unit-files --state=enabled --user > $apps/systemd-user-units.txt

    # flatpak
    flatpak list --app --columns=name,application > $apps/flatpak.txt

    # edited files not in .config
    rsync --files-from=(realpath ~/.config/rsync/etc_modified_list.txt) / ~/.config

end
