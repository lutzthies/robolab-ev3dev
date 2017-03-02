#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# dependencies python will be linked against
# libjpeg62-turbo-dev (pillow)
# libssl-dev (pip)
# zlib1g-dev (pillow)
apt-get install --yes --no-install-recommends \
    gawk \
    guile-1.8 \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline6-dev \
    libdb5.3-dev \
    libgdbm-dev \
    libsqlite3-dev \
    libbz2-dev \
    libexpat1-dev \
    liblzma-dev \
    libssl-dev \
    unzip \
    libtool \
    automake \
    make \
    m4 \
    autoconf \
    libjpeg62-turbo-dev \
    libssl-dev \
    zlib1g-dev

# get and extract python source
wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz
tar xvf Python-3.6.0.tgz
cd Python-3.6.0

# enable zlib1-dev
sed -ie 's/^#zlib/zlib/' ./Modules/Setup.dist

# enable openssl
sed -ie 's/^#_socket/_socket/;s/^#SSL/SLL/;s/^#_ssl/_ssl/;s/^#        -DUSE_SSL/        -DUSE_SSL/;s/^#        -L$(SSL)/        -L$(SSL)/' ./Modules/Setup.dist

# configuration
./configure

# make it
# assuming to build on a 4 core CPU
make -j4

# install without prefix as this will be the only python version on the bricks
# use altinstall if you want to keep a prefix and mutliple versions of python
make install

# install python packages
# pillow (python-ev3dev)
# python-ev3dev
# paho-mqtt
pip3 install --upgrade pip && pip3 install pillow paho-mqtt python-ev3dev
