function backup_config -d "Backup system configuration"
    
    set apps ~/.config/apps
    rm -rf ~/.config/etc

    # pacman
    pacman -Qqe > $apps/pacman-explicit.txt
    pacman -Qqem > $apps/pacman-aur.txt

    # pipx (can't remove version numbers)
    pipx list --short > $apps/pipx.txt

    # vscode extensions
    code --list-extensions > $apps/code-extensions.txt

    # systemd unit files
    systemctl list-unit-files --state=enabled > $apps/systemd-units.txt

    # edited files not in .config
    rsync --files-from=(realpath ~/.config/rsync/etc_modified_list.txt) / ~/.config

end
