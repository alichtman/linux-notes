# Swap Space

## Recommended Amounts of Swap Space

Everyone has their own opinions about how much swap space you need. Here are some of mine:

If you are using **hibernate**, your swap space **MUST** be greater than or equal to your RAM size. (And you should not be using hibernate on Ubuntu. Leave it disabled.)

| Amount of system RAM  | Recommended swap space              |
| ---                   | ---                                 |
| less than 2 GB        | 2 times the amount of RAM           |
| 2 GB - 8 GB           | Equal to the amount of RAM          |
| 8 GB - 64 GB          | 0.5 - 0.75 times the amount of RAM  |
| more than 64 GB       | 0.5 times the amount of RAM         |

I use 16GB of swap space with 32GB of RAM.

## How to Add More Swap Space

### Extend Swap LVM Partition

> NOTE: This is a very dangerous operation. Make solid backups before doing anything.

https://askubuntu.com/a/303723/1082990

```bash
# Determine the name of the swap logical volume using the "lvs" command
$ lvs
LV VG Attr LSize Origin Snap% Move Log Copy%
root_lv volgroup0 -wi-ao 7.00G
swap_lv1 volgroup0 -wi-ao 30.00G
tmp_lv volgroup0 -wi-ao 3.00G
usr_lv volgroup0 -wi-ao 7.00G
var_lv volgroup0 -wi-ao 4.00G

# Turn off the swap partition
$ sudo swapoff /dev/volgroup0/swap_lv1

# Resize the swap partition, adding 15GB more space to it
$ sudo lvresize -L+15G /dev/volgroup0/swap_lv1
Extending logical volume swap_lv1 to 30.00 GB
Logical volume swap_lv1 successfully resized

# Format the new swap space to make it usable
$ sudo mkswap /dev/volgroup0/swap_lv1
Setting up swapspace version 1, size = 41875927 kB

# Turn the swap volume back on
$ sudo swapon /dev/volgroup0/swap_lv1

# Use free command to show your new swap space
$ free -t | grep -i swap
Swap: 30719 0 30719
```

### Create Swap File

> NOTE: This is LESS dangerous than messing with LVM partitions, but still dangerous.
> NOTE: You should condition yourself to be terrified of `dd` commands. Read it out loud 3 times before you run it, and make a sacrifice to the dd gods to show your faith.

https://askubuntu.com/a/178726/1082990

```bash
# Get current swap status
$ cat /proc/swaps
$ grep "Swap" /proc/meminfo

# Create empty file. This command will create a 1GB file which means +1GB swap space for your system
# If you want to make 3GB file, then change count value to count=3M. See man dd for more information.
$ sudo dd if=/dev/zero of=/swapfile bs=1024 count=1M

# Fix permissions
$ sudo chmod 0600 /swapfile

# Make it a swap file
$ sudo mkswap /swapfile

# Bring up on boot
# To make sure that your new swap space is activated while booting up computer you should add it to filesystem configuration file (/etc/fstab). Add it to end of file, this is recommended because other filesystems (at least one that contains swap file) must be mounted in read-write mode before we can access any files.
# Add this line to /etc/fstab at the end
/swapfile swap swap sw 0 0

# Activate
$ sudo swapon /swapfile
```
