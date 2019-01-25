#!/bin/sh

set -eu

USER=${1:-user}

adduser --gecos "$USER" \
        --disabled-password \
        --shell /bin/bash \
        "$USER"
adduser "$USER" sudo
echo "$USER:$USER" | chpasswd
