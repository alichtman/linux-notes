# AMD RX 5500 XT GPU

Ah, hello. You're probably here because you're having some issues. Welcome to GPUs on Linux.

## Using `amdgpu` Drivers

```bash
$ lspci -k|egrep 'VGA|in use'
```

If this output doesn't contain "Kernel driver in use: amdgpu", you're not using the correct drivers.

Run this to see if there are any errors.

```bash
$ sudo dmesg | rg "amdgpu"
```

The error I got was: `VGACON disables amdgpu kernel modesetting.`

This will show the driver currently being used by your GPU.

```bash
$ inxi -G
```

I fixed this by removing `nomodeset` in the GRUB boot parameters. You can set the default parameters in `/etc/default/grub`.

The new line is:

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=uvesafb:mode_option=2560x1440-24,mtrr=3,scroll=ywrap"
```

Save the file and run `$ sudo update-grub`, and restart the system.

## Tear Free Rendering

If you're getting screen tearing, create the file `/etc/X11/xorg.conf.d/20-amdgpu.conf` and add the following:

```
Section "Device"
     Identifier "AMD"
     Driver "amdgpu"
     Option "TearFree" "true"
EndSection
```

Restart and the problem should be fixed.
