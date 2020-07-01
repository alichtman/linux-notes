# TODOs

## Roadmap

- bspwm
- polybar
- rofi
- sxhkd

## Staging

- Timeshift setup
- Add `ifconfig tun0 | awk '/inet / {print $2}'` to ~/.config/tmux/scripts/htb_ip.sh
- htb_script.sh from gist.github.com

## Backlog

- Run OpenRGB on startup
- neofetch --memory_percent on --disk_display infobar --sixel /home/alichtman/Pictures/Wallpapers/spaceship.jpg
- Switch to urxvt or st


```
[Unit]
Description=OpenRGB control

[Service]
Type=oneshot
ExecStart=/opt/OpenRGB/OpenRGB -c 080808 -m Static
User=nobody
Group=i2c

[Install]
WantedBy=multi-user.target
```

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
    * D/U speed
    * Date / Time
    * # of desktops
    * Power menu
    * Volume indicator
    * Host name
    * Notifications
    * Music
    * Wifi Menu + Ssid
    * Weather

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



## TABS

### Polybar

- https://wiki.archlinux.org/index.php/Polybar#Running_Polybar
- https://github.com/polybar/polybar/wiki/Fonts#debugging-font-issues
- https://github.com/polybar/polybar
- https://github.com/jaagr/dots/blob/master/.local/etc/themer/themes/space/polybar
- https://github.com/Jvanrhijn/polybar-spotify
- https://github.com/polybar/polybar/wiki/Debugging-your-Config
- https://github.com/3ximus/dotfiles/blob/master/.config/polybar/config


### Random Shit

- https://github.com/AsamK/signal-cli
- https://github.com/AsamK/signal-cli
- https://askubuntu.com/questions/179889/how-do-i-set-up-an-email-alert-when-a-ssh-login-is-successful
- https://duckduckgo.com/?q=fail2ban&t=canonical&atb=v220-6&ia=web
- https://github.com/adi1090x/dots
- https://wiki.archlinux.org/index.php/Xinit#Configuration
- https://wiki.archlinux.org/index.php/x_resources
- https://www.reddit.com/r/unixporn/comments/8giij5/guide_defining_program_colors_through_xresources/
- https://github.com/mut-ex/wallblur


### Rofi

- https://github.com/davatorium/rofi/wiki/User-scripts
- https://github.com/fogine/rofi-search
- https://github.com/fogine/rofi-search/blob/master/rofi-search
- https://github.com/M3NIX/rofi-spotify
- https://gitlab.com/vahnrr/rofi-menus#simpler-menu-summoning
- https://github.com/davatorium/rofi/wiki/themes
- https://github.com/carnager/teiler


### bspwm

- https://youtu.be/k7z1CkpsYgQ
- https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies
- https://www.reddit.com/r/unixporn/comments/gfhons/bspwm_im_a_thief/
- https://protesilaos.com/pdfd/basics-my-bspwm/
- https://www.reddit.com/r/unixporn/comments/ejw2j3/bspwm_polybar_zsh/
- https://imgur.com/a/3VYlkGF
- https://www.google.com/search?hl=en&ei=5zTCXsaqM8vOtQbT4JvgDg&q=bspwm+global+menu&oq=bspwm+glob&gs_lcp=CgZwc3ktYWIQAxgAMgYIABAWEB46BAgAEEc6BQgAEJECOgIIADoFCAAQgwE6BAgAEEM6BwgAEIMBEENQpRBYnx1g7CNoAHADeACAAaMBiAGaB5IBAzkuMZgBAKABAaoBB2d3cy13aXo&sclient=psy-ab
