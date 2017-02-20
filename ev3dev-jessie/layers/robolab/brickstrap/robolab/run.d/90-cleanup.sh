# flash-kernel is triggered by some of the package installs and results in
# backup files being created in the boot partition.
rm -f /boot/flash/*.bak
