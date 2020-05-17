# VMware and Virtualbox

## AMD-V Supported But Not Enabled Error

Must enable `AMD-V` in BIOS. Sometimes it's called `SVM`.

In the Gigabyte Aorus x570 BIOS I have, it was located here:

Tweaker > Advanced CPU Settings > Advanced CPU Core Settings > SVM Mode > ENABLE

Save, boot, then shut down and turn the PSU off. Boot up and you should be good.

## VMware

[VMware Workstation Pro](https://websiteforstudents.com/installing-vmware-workstation-14-pro-ubuntu-17-04-17-10/)

Free license through UIUC Web Store.


## Virtualbox

```bash
$ sudo apt install virtualbox
```
