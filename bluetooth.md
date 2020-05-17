# Bluetooth

Yeah, so Bluetooth sucks to get working.

## Issues

### No Default Controller Available

```bash
$ bluetoothctl
Agent registered
[bluetooth]# show
No default controller available
[bluetooth]# quit

$ journalctl -b | grep Bluetooth
May 13 04:45:26 arctic kernel: Bluetooth: Core ver 2.22
May 13 04:45:26 arctic kernel: Bluetooth: HCI device and connection manager initialized
May 13 04:45:26 arctic kernel: Bluetooth: HCI socket layer initialized
May 13 04:45:26 arctic kernel: Bluetooth: L2CAP socket layer initialized
May 13 04:45:26 arctic kernel: Bluetooth: SCO socket layer initialized
May 13 04:45:27 arctic systemd[1]: Starting Bluetooth service...
May 13 04:45:27 arctic bluetoothd[882]: Bluetooth daemon 5.53
May 13 04:45:27 arctic systemd[1]: Started Bluetooth service.
May 13 04:45:27 arctic systemd[1]: Reached target Bluetooth.
May 13 04:45:27 arctic bluetoothd[882]: Bluetooth management interface 1.14 initialized
May 13 04:45:27 arctic kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
May 13 04:45:27 arctic kernel: Bluetooth: BNEP filters: protocol multicast
May 13 04:45:27 arctic kernel: Bluetooth: BNEP socket layer initialized
May 13 04:45:28 arctic kernel: Bluetooth: hci0: Reading Intel version information failed (-110)
May 13 04:45:28 arctic kernel: Bluetooth: hci0: command tx timeout
May 14 04:34:04 arctic systemd[1780]: Starting Bluetooth OBEX service...
May 14 04:34:04 arctic systemd[1780]: Started Bluetooth OBEX service.
May 14 04:39:11 arctic kernel: Bluetooth: hci0: Bootloader revision 0.3 build 0 week 24 2017
May 14 04:39:11 arctic kernel: Bluetooth: hci0: Device revision is 1
May 14 04:39:11 arctic kernel: Bluetooth: hci0: Secure boot is enabled
May 14 04:39:11 arctic kernel: Bluetooth: hci0: OTP lock is enabled
May 14 04:39:11 arctic kernel: Bluetooth: hci0: API lock is enabled
May 14 04:39:11 arctic kernel: Bluetooth: hci0: Debug lock is disabled
May 14 04:39:11 arctic kernel: Bluetooth: hci0: Minimum firmware build 1 week 10 2014
May 14 04:39:11 arctic kernel: Bluetooth: hci0: Found device firmware: intel/ibt-20-1-3.sfi
May 14 04:39:12 arctic kernel: Bluetooth: hci0: Waiting for firmware download to complete
May 14 04:39:12 arctic kernel: Bluetooth: hci0: Firmware loaded in 1206057 usecs
May 14 04:39:12 arctic kernel: Bluetooth: hci0: Waiting for device to boot
May 14 04:39:13 arctic kernel: Bluetooth: hci0: Device booted in 14586 usecs
May 14 04:39:13 arctic kernel: Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-20-1-3.ddc
May 14 04:39:13 arctic kernel: Bluetooth: hci0: Failed to send Intel_Write_DDC (-22)
May 14 04:44:35 arctic kernel: Bluetooth: hci0: Firmware revision 0.0 build 128 week 11 2020
May 14 04:45:37 arctic systemd[1]: Stopping Bluetooth service...
May 14 04:45:37 arctic systemd[1]: Stopped Bluetooth service.
May 14 04:45:37 arctic systemd[1]: Starting Bluetooth service...
May 14 04:45:37 arctic bluetoothd[21977]: Bluetooth daemon 5.53
May 14 04:45:37 arctic systemd[1]: Started Bluetooth service.
May 14 04:45:37 arctic bluetoothd[21977]: Bluetooth management interface 1.14 initialized
```

#### Solution

> Have you tried turning it off and back on again?

```bash
$ sudo rmmod btusb
$ sleep 1
$ sudo modprobe btusb
```
