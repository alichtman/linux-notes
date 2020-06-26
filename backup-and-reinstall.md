# Backup and Reinstall

## Snapshot Method

https://itsfoss.com/backup-restore-linux-timeshift/

Make sure to back up ALL files, including `/home`. Exclude `/media` and `/tmp`. Use an external drive or this backup is useless. Remember to configure how many backups to keep for how long...

## Rsync Method

https://wiki.archlinux.org/index.php/Rsync#As_a_backup_utility

### Full System Backup

Ubuntu automatically mounts drives for you under `/media/alichtman`, so the mounting step isn't needed. Just run the `rsync` command.

```bash
# Find backup drive location with:
$ sudo fdisk -l
# Mount it (replace /dev/sda if needed)
$ sudo mount /dev/sda /mnt
# rsync / to /mnt, excluding unnecessary dirs
$ sudo rsync -aAXv --info=progress2 --no-inc-recursive --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /media/alichtman/Backup
```

### Reinstallation

To reinstall, repeat the same steps, but reverse the source and the destination.

```bash

# Find backup drive location with:
$ sudo fdisk -l
# Mount it (replace /dev/sda if needed)
$ sudo mount /dev/sda /mnt
# rsync / to /mnt, excluding unnecessary dirs
$ sudo rsync -aAXv --info=progress2 --no-inc-recursive --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /mnt /
```
