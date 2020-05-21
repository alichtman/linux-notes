# bspwm -- Binary Space Partitioning Window Manager

bspwm is tightly integrated with sxhkd. All your hotkey bindings are handled by sxhkd, and bspwm is just a window manager.

bspwm config goes in ~/.config/bspwm/bspwmrc, and it must be executable.

| Key Combo                          | Action                                   |
| ---                                | ---                                      |
| `SUPER + [ or ]`                   | Cycle desktop to left or right.          |
| `SUPER + ENTER`                    | Open new terminal                        |
| `SUPER + Ctrl + [h / j / k / l]`   | Change preselection for window opening   |
| `SUPER + Shift + [h / j / k / l]`  | Move window                              |
| `SUPER + w`                        | Close window (TODO: Remap to SUPER + Q)  |
| `SUPER + s`                        | Toggle floating and tiling modes         |
| `SUPER + Left Click`               | Move window around                       |
| `SUPER + Right Click`              | Resize corner                            |
| `SUPER + Middle Click`             | Resize edge                              |
