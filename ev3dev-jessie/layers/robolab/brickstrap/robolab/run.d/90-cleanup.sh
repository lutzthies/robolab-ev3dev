#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# flash-kernel is triggered by some of the package installs and results in
# backup files being created in the boot partition.
rm -f /boot/flash/*.bak

# Disable journaling of systemd as it takes up too much memory
#rm /lib/systemd/systemd-journald && rm /lib/systemd/system/systemd-journald*
