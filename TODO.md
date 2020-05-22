# TODOs

## Roadmap

- bspwm
- polybar
- rofi
- sxhkd
- shallow-backup dots
- Keyboard issues (numpad support)


## Staging

- Copy files from Jon's laptop to my Kali VM
- Timeshift setup

## Backlog

- Run OpenRGB on startup
- kripton icons
- zsh-history-substring-search
    * Fix keybindings in zshrc!
- Install pyenv
    * /usr/local/bin permission error
- polybar
    * [spotify plugin](https://github.com/Jvanrhijn/polybar-spotify)
    * [cpu](https://github.com/polybar/polybar/wiki/Module:-cpu)
    * [date](https://github.com/polybar/polybar/wiki/Module:-date)
    * [memory](https://github.com/polybar/polybar/wiki/Module:-memory)
    * [script](https://github.com/polybar/polybar/wiki/Module:-script)
    * [temp](https://github.com/polybar/polybar/wiki/Module:-temperature)
    * https://arcolinux.com/all-modules-that-are-available-for-polybar-any-desktop/
    * [toggl](https://github.com/jduar/toggl_tools)
- rofi
    * theme
    * plugins
- WM/DE config
- pywal
    * https://github.com/dylanaraps/pywal/wiki/Getting-Started
- Back up grub files in shallow-backup
- Skip grub menu, boot directly into Ubuntu
- sxhkd + key remappings
    * sxhkd autostart in xinit?
    * Why do maps with SUPER not work?
        + Switch everything to ALT?
- st build
    * https://www.youtube.com/watch?v=FJmm7wl4JUI
    * Images in neofetch?
- Dotfiles
    * https://github.com/3ximus/dotfiles
        + bspwm
        + sxhkd
        + polybar
        + Color change spotify
        + blur fullscreen rofi
- Fix plymouth boot splash


```bash
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep bspwm || startx
fi
```
