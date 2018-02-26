#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# flash-kernel is triggered by some of the package installs and results in
# backup files being created in the boot partition.
rm -f /boot/flash/*.bak

# remove pip as we dont want students to install other packages
#pip3 uninstall pip --yes

######################
# PERFORMANCE TWEAKS
######################

# SYSTEMD
# disable journaling of systemd as it takes up too much memory
rm /lib/systemd/systemd-journald && rm /lib/systemd/system/systemd-journald*

# SAMBA
# disable smbd from running by default.
systemctl disable smbd.service
# we really don't want this running - it causes a long timeout on boot
systemctl mask samba-ad-dc.service

# AVAHI used for .local resolution
# suggestion: keep it
#systemctl disable avahi-daemon.service
