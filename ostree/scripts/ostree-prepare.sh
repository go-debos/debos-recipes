#!/bin/bash

set -e

# Creates /home and /srv in ways incorrect for ostree
rm -f /usr/lib/tmpfiles.d/home.conf

# tries to create unneeded legacy file
rm -f /usr/lib/tmpfiles.d/dbus.conf

# Empty etc/machine-id so it's regenerated on first device boot
echo > /etc/machine-id
