#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# Get gpg-key for our RoboLab repository server
wget -O - -q https://robolab.inf.tu-dresden.de/pub/gpg-key | apt-key add -

apt-get update

apt-get install --yes --no-install-recommends \
    git \
    htop \
    python3.6 \
    python3-pil \
    python3-distutils \
    rsync \
    sshfs \
    tmux \
    ev3-robolab-startup

# Create symlink for python3.6
ln -sf /usr/bin/python3.6 /usr/bin/python3

# Set default python version
update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1

# Install python3-pip
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py

# Install packages required
pip3 install paho-mqtt python-ev3dev reloader
