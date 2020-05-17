# Fonts

Fonts live in `/usr/share/fonts/opentype` and `/usr/share/fonts/truetype`.

Copy your font files there, like:

```bash
$ cp -r new_font_dir /usr/share/fonts/truetype/new_font
# Refresh the font cache
$ fc-cache -f -c
```
