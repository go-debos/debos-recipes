#!/bin/sh

set -e

echo "I: create user"
useradd --comment "User" --create-home --shell /bin/bash user

echo "user	ALL=NOPASSWD: ALL" >/etc/sudoers.d/user
chmod 440 /etc/sudoers.d/user

echo "I: set user password"
echo "user:user" | chpasswd
