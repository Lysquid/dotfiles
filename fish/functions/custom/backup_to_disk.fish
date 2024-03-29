function backup_to_disk -d "Backup all useful files to an external disk"
    rsync \
    -aPh \
    --delete \
    --delete-excluded \
    --exclude-from=/home/rom1/.config/rsync/exclude_list.txt \
    /etc \
    /home \
    /mnt \
    "/run/media/rom1/Backup Disk/arch" \
    $argv
end
