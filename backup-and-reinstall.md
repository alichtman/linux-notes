# Backup and Reinstall

https://wiki.archlinux.org/index.php/Rsync#As_a_backup_utility


**TODO: Upgrade to snapshots**

## Full System Backup

Ubuntu automatically mounts drives for you under `/media/alichtman`, so the mounting step isn't needed. Just run the `rsync` command.

```bash
# Find backup drive location with:
$ sudo fdisk -l
# Mount it (replace /dev/sda if needed)
$ sudo mount /dev/sda /mnt
# rsync / to /mnt, excluding unnecessary dirs
$ sudo rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /media/alichtman/Backup
```

## Reinstallation

To reinstall, repeat the same steps, but reverse the source and the destination.

```bash

# Find backup drive location with:
$ sudo fdisk -l
# Mount it (replace /dev/sda if needed)
$ sudo mount /dev/sda /mnt
# rsync / to /mnt, excluding unnecessary dirs
$ sudo rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /mnt /
```

## TODO

- Snapshot backup (TimeMachine style)
