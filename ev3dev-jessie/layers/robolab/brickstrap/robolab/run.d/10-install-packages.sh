#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# get key for RoboLab package server
wget -O - -q http://robolab.inf.tu-dresden.de:2222/gpg-key | apt-key add -
apt-get update

apt-get install --yes --no-install-recommends \
    git \
    htop \
    python3.6 \
    python3-pil \
    rsync \
    samba \
    smbnetfs \
    sshfs \
    tmux \
    robolab-ev3dev-startup

# create symlink for python3.6
ln -sf /usr/bin/python3.6 /usr/bin/python3

# PIP

# install python3-pip
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py

# install packages
# python-ev3dev
# paho-mqtt
# reloader
pip3 install paho-mqtt python-ev3dev reloader
