function backup_to_disk -d "Backup all useful files to an external disk"
    backup_config
    rsync \
    -aPh \
    --delete \
    --delete-excluded \
    --exclude-from=(realpath ~/.config/rsync/backup_exclude_list.txt) \
    /etc \
    /home \
    /mnt \
    "/run/media/rom1/Backup/arch" \
    $argv
end
