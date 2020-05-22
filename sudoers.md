# `/etc/sudoers`

This file allows you to configure how `sudo` commands are run. Be extremely careful editing this file, both for security concerns and because you can lock yourself out of `root`.

## Run certain `sudo` commands without password

Add this line to `/etc/sudoers`:

```
# Allow me to execute some sudo commands without a password
alichtman ALL=(ALL) NOPASSWD: /home/alichtman/open-source-software/OpenRGB/OpenRGB, /usr/bin/apt install, /usr/bin/apt update, /usr/bin/apt autoremove, /usr/bin/apt upgrade
```

## Don't make me enter my `sudo` password again in another terminal

```
Defaults !tty_tickets
```
