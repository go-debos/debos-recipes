#!/bin/bash

set -e
wget https://people.debian.org/~ah/u-boot-rpi_2020.04+dfsg-2+rpi4_arm64.deb
dpkg -i u-boot-rpi_2020.04+dfsg-2+rpi4_arm64.deb
rm u-boot-rpi_2020.04+dfsg-2+rpi4_arm64.deb
