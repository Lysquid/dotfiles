# Sync files with cloud storage

function drive_sync
    rclone sync ~/ drive:Laptop \
    --filter-from .config/rclone/filter.txt \
    --skip-links \
    --delete-excluded \
    $argv
end