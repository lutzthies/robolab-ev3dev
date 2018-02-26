#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen
echo 'LANG="C.UTF-8"'>/etc/default/locale
/usr/sbin/dpkg-reconfigure --frontend=noninteractive locales
update-locale LANG="en_GB.UTF-8"
update-locale LC_CTYPE="C.UTF-8"
update-locale LC_NUMERIC="de_DE.UTF-8"
update-locale LC_TIME="de_DE.UTF-8"
update-locale LC_MONETARY="de_DE.UTF-8"
update-locale LC_PAPER="de_DE.UTF-8"
update-locale LC_MEASUREMENT="de_DE.UTF-8"
