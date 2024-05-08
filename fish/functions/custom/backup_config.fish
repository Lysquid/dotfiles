function backup_config -d "Backup system configuration"
    rm -rf ~/.confg/apps ~/.config/etc

    # installed softwares
    pacman -Qq > ~/.config/apps/pacman-all.txt
    pacman -Qqe > ~/.config/apps/pacman-explicit.txt
    pacman -Qqem > ~/.config/apps/pacman-aur.txt
    # pipx
    pipx list --short > ~/.config/apps/pipx.txt
    # vscode extensions
    code --list-extensions > ~/.config/apps/code-extensions.txt

    # systemd unit files
    systemctl list-unit-files --state=enabled > ~/.config/apps/systemctl-enabled.txt

    # edited files not in .config
    rsync --files-from=(realpath ~/.config/rsync/etc_modified_list.txt) / ~/.config

end
