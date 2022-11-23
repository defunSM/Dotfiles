#!/usr/bin/env bash

# Starting Windows 10 virtual machine with looking glass.
# Borrowed from: https://forum.level1techs.com/t/guide-painlessly-adding-audio-support-to-a-looking-glass-windows-10-machine-using-scream/148938

# This script is meant to be run as sudo
[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1

# Start the VM using libvirt
virsh start win10-gaming

# Start looking glass
sudo -u $SUDO_USER /home/$SUDO_USER/bin/looking-glass-B5-413-eb1774f9/client/build/looking-glass-client >/dev/null 2>&1 &

# Waiting for processes to close
wait -n
