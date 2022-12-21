function backup_to_disk
    rsync \
    -aPht \
    --delete \
    --delete-excluded \
    --exclude-from=/home/rom1/.config/rsync/exclude_list.txt /etc /home /run/media/rom1/Backup\ Disk/arch
end