#!/bin/sh

set -e

echo "$1" >/etc/hostname
echo "127.0.0.1	localhost $1" >/etc/hosts

