# Initramfs

# initramfs Unpacking Failed: Decoding

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1835660

Edit `/etc/initramfs-tools/initramfs.conf` and change `COMPRESS=lz4` to `COMPRESS=gzip`.

Then run `$ sudo update-initramfs -u`
