#!/bin/bash

set -e
wget http://ftp.us.debian.org/debian/pool/main/u/u-boot/u-boot-rpi_2018.09+dfsg-1_arm64.deb
dpkg -i u-boot-rpi_2018.09+dfsg-1_arm64.deb
rm u-boot-rpi_2018.09+dfsg-1_arm64.deb
