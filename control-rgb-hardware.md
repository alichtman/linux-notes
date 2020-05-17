# Control RGB Hardware

## Software

- [Colorsair](https://github.com/Chlorek/Colorsair)
    * Corsair RGB Fans (Lightning Node) driver and API for Unix systems
    * effects (Breathing, Linear color change, Static)
    * any number of fans connected to Node's socket #1
    * handles different framerates

- [OpenCorsairLink](https://github.com/audiohacked/OpenCorsairLink/wiki/Supported-Devices)
    * Supported Water Coolers
        +  H100i (HID)
        +  H100i GTX
        +  H100i v2 (Asetek)
        +  H110i (HID)
        +  H115i (Asetek)
        +  H115i Pro (Asetek Pro)
    * Supported Additional CorsairLink Devices
        + Commander Pro

- [OpenRGB](https://gitlab.com/CalcProgrammer1/OpenRGB/-/tree/master)
    * Fans and Coolers
        + AMD Wraith Prism
        + NZXT Kraken X42/X52/X62/X72
    * LED Strip and Fan Controllers
        + ASUS ROG Aura Terminal
        + NZXT Hue+
        + NZXT Hue 2 and NZXT Smart Device V2
        + Corsair Lighting Node Core
        + Corsair Lighting Node Pro
        + Corsair Commander Pro
        + Keyboard Visualizer Arduino LED strips
        + E1.31 Streaming ACN Protocol
        + Thermaltake Riing Plus
    * RAM
        + G.Skill Trident Z Neo
    * Motherboard
        + Gigabyte X570 Aorus Pro

- [openrazer](https://github.com/openrazer/openrazer)
    * Razer Ornata Chroma

- [Hue-Plus](https://github.com/kusti8/hue-plus)
    * A Windows and Linux driver in Python for the NZXT Hue+
    * Supports all functionality except FPS, CPU, and GPU lighting.

- [krakenx](https://github.com/KsenijaS/krakenx)
    * Python script to control NZXT cooler Kraken X52/X62 in Linux
    * Full color control, fan and pump speed

- [liquidctl](https://github.com/jonasmalacofilho/liquidctl)
    * Cross-platform CLI and Python drivers for AIO liquid coolers and other devices


## AMD Wraith Prism

This fan comes with two USB headers. Only connect the USB header from the fan to the board.

https://www.youtube.com/watch?v=wzAtfcPWfOw

## Razer Ornata Chroma

```bash
sudo add-apt-repository ppa:openrazer/stable
sudo apt update
sudo apt install openrazer-meta
```

## OpenRGB Config

```bash
$ sudo chmod 777 /dev/i2c-*
$ sudo ./OpenRGB
```

Follow OpenRGB setup instructions to add necessary kernel modules (first temporarily with `modprobe`, and then permanently in `/etc/modules`.)

Must add `acpi_enforce_resources=lax` to `/etc/default/grub` `GRUB_CMDLINE_LINUX_DEFAULT` and run `$ sudo update-grub`
