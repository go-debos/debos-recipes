# Weston

## Build an image and run it in the QEMU emulator.

First, make sure you have KVM installed:

```sh
$ sudo apt install qemu-kvm ovmf
```

Now that that’s done, let’s create the images, run:

```sh
$GOPATH/bin/debos images/weston/debian-base.yaml
$GOPATH/bin/debos images/weston/debian-qemu-uefi.yaml
```

Will create the following output:

- debian-base-buster-amd64.tar.gz, a tarball with the debian base filesystem.
- debian-qemu-uefi-buster-amd64.img, an image file for QEMU emulator.
- debian-qemu-uefi-buster-amd64.vdi, a VirtualBox image.

The final command runs the image using the QEMU emulator:

```sh
$ kvm -bios /usr/share/qemu/OVMF.fd \
      -drive format=raw,file=debian-qemu-uefi-buster-amd64.img \
      -net none -serial stdio -m 1G -cpu host -smp 2
```

## Build an image and flash it into the supported boards.

Supported machines:
- boneblack, the Beaglebone Black Board (AM335x)
- omap3-igep, the OMAP3 IGEPv2 Board (DM3730)
- wandboard, the Wandboard Solo/Dual/Quad (i.MX6)

To create the images, run:

```sh
$GOPATH/bin/debos images/weston/debian-base.yaml
$GOPATH/bin/debos images/weston/debian-$machine.yaml
```

Will create the following output:

- debian-base-buster-armhf.tar.gz, a tarball with the debian base filesystem.
- debian-$machine-buster-armhf.img.gz, a gz-compressed image file for a $machine board.
- debian-$machine-buster-armhf.img.gz.md5, the image checksum.
- debian-$machine-buster-armhf.img.bmap, a bitmap summary for faster flashing via bmaptools.

To flash it, assuming your SD card is /dev/mmcblk0, use:

```
bmaptool copy debian-$machine-buster-armhf.img.gz /dev/mmcblk0
```

The bmap file is automatically looked for in the current directory.
