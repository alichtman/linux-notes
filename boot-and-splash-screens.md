# Boot, and Splash Screens

## Boot Directly to Linux

For documentation, run: `$ info -f grub -n 'Simple configuration'`.

https://help.ubuntu.com/community/Grub2/Setup#Script_Descriptions

> NOTE: This section does not fully work yet. Gave up because I don't care too much.

Open `/etc/default/grub`. Change `GRUB_DEFAULT=0` to `GRUB_DEFAULT=saved`, and set `GRUB_SAVEDEFAULT=true`.

```
# Change these
GRUB_DEFAULT=saved

# Add these
GRUB_SAVEDEFAULT=true
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=false
<!-- GRUB_DISABLE_OS_PROBER=true -->
```

Then run:

```bash
$ sudo grub-set-default 0
$ sudo update-grub2
$ sudo update-initramfs -u
```

## Splash Screens

`plymouth` lets you configure your boot splash screen.

### Installation

https://askubuntu.com/a/362998

```bash
$ apt install plymouth plymouth-themes plymouth-x11 v86d
$ git clone https://github.com/adi1090x/plymouth-themes.git ~/open-source-software/plymouth-themes
$ cd ~/open-source-software/plymouth-themes
$ sudo cp -r \
    pack_1/colorful \
    pack_1/colorful_loop \
    pack_1/colorful_sliced \
    pack_1/cuts \
    pack_1/cuts_alt \
    pack_4/rings \
    pack_4/rings \
    pack_4/sliced \
    pack_4/sphere \
    pack_4/splash \
    /usr/share/plymouth/themes/
# To install the Splash theme
$ sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/splash/splash.plymouth 100
$ sudo update-alternatives --config default.plymouth
```

Now, we do some `grub` config editing.

```bash
$ vim /etc/default/grub
```

Replace the following lines:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
#GRUB_GFXMODE=640x480
```

With:

> Note that `nomodeset` has been removed from GRUB_CMDLINE_LINUX_DEFAULT, meaning that the fix for not using `admgpu` drivers is included.

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=uvesafb:mode_option=2560x1440-24,mtrr=3,scroll=ywrap"
GRUB_GFXMODE=2560x1440
```

```bash
$ vim /etc/initramfs-tools/modules
```

Add this line to the bottom:

```
uvesafb mode_option=2560x1440-24 mtrr=3 scroll=ywrap
```

Then, run the following commands.

```bash
$ echo FRAMEBUFFER=y | sudo tee /etc/initramfs-tools/conf.d/splash
$ sudo update-initramfs -u
$ sudo update-grub2
```

Reboot, and you should see the start up splash screen.

### Plymouth Themes

Check out this repo for some nice [plymouth-themes](https://github.com/adi1090x/plymouth-themes).

The ones I really like are bolded.

#### Favorite Themes

- Colorful Loop
- Colorful Sliced
- Colorful
- Cuts Alt
- Cuts
- Rings
- Sliced
- Sphere
- Splash

#### Notable Themes

- Abstract Rings
- Abstract Rings Alt
- Angular
- Blockchain
- Circle Flow
- Hexa Retro
- Hexagon
- Hexagon 2
- Liquid
- Loader 2
- Lone
- Metal Ball
- Polaroid
- Spinner Alt
