#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# flash-kernel is triggered by some of the package installs and results in
# backup files being created in the boot partition.
rm -f /boot/flash/*.bak

# Remove pip as we don't want students to install other packages
pip3 uninstall pip --yes

apt-get autoremove --yes
apt-get clean

# Remove cached files
rm /get-pip.py
rm -rf /var/lib/apt/lists/*


######################
# PERFORMANCE TWEAKS
######################

# Disable journaling of systemd as it takes up too much memory
systemctl mask systemd-journald.service
