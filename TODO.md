# TODOs

## Roadmap

- bspwm
- polybar
- rofi
- sxhkd
- shallow-backup dots

## Staging

- Timeshift setup
- Add `ifconfig tun0 | awk '/inet / {print $2}'` to ~/.config/tmux/scripts/htb_ip.sh
- htb_script.sh from gist.github.com

## Backlog

- Run OpenRGB on startup

- zinit completions folder not always created bug

- kripton icons

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

- pywal
    * https://github.com/dylanaraps/pywal/wiki/Getting-Started

- sxhkd
    * Why do maps with SUPER not work?

- st build
    * https://www.youtube.com/watch?v=FJmm7wl4JUI

- Images in neofetch

- Dotfiles
    * https://github.com/3ximus/dotfiles
        + bspwm
        + sxhkd
        + polybar
        + Color change spotify
        + blur fullscreen rofi

- Dual boot Windows on separate SSD?
    * Make sure not to buy the same brand!!
    * https://askubuntu.com/questions/1033497/dual-boot-windows-10-and-linux-ubuntu-on-separate-ssd


```bash
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep bspwm || startx
fi
```
