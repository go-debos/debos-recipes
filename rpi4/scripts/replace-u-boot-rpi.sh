#!/bin/bash

set -e
#wget https://people.debian.org/~ah/u-boot-rpi_2020.04+dfsg-2+rpi4_arm64.deb
#dpkg -i u-boot-rpi_2020.04+dfsg-2+rpi4_arm64.deb
#rm u-boot-rpi_2020.04+dfsg-2+rpi4_arm64.deb
wget https://snapshot.debian.org/archive/debian/20200709T084659Z/pool/main/u/u-boot/u-boot-rpi_2020.07%2Bdfsg-1_arm64.deb
dpkg -i u-boot-rpi_2020.07+dfsg-1_arm64.deb
rm u-boot-rpi_2020.07+dfsg-1_arm64.deb
