# Kernel Upgrade

First, back up your entire system. Prepare for this to not work at all.

Then, follow this guide: https://www.tecmint.com/upgrade-kernel-in-ubuntu/

## TL;DR

Go to http://kernel.ubuntu.com/~kernel-ppa/mainline/ and find the kernel version you want to install. Click on it.

Download all the `.deb` files using `wget`:

```bash
$ mkdir /tmp/kernel-update && cd /tmp/kernel-update
$ wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.0/linux-headers-5.0.0-050000_5.0.0-050000.201903032031_all.deb
$ wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.0/linux-headers-5.0.0-050000-generic_5.0.0-050000.201903032031_i386.deb
$ wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.0/linux-image-5.0.0-050000-generic_5.0.0-050000.201903032031_i386.deb
$ wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.0/linux-modules-5.0.0-050000-generic_5.0.0-050000.201903032031_i386.deb

# Then install and reboot
$ sudo dpkg -i *.deb
$ sudo reboot
```
