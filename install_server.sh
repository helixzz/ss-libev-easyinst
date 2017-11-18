#!/bin/bash

# Reminder
read -p "You're installing [ ss-server ]. Confirm or hit Ctrl-C to exit."

# Install prerequisites
sudo apt-get update
sudo apt-get -y -qq install libev4 libsodium18 libmbedcrypto0

# Copy binary files
echo "Copying binary files..."
chmod a+x bin/ss-*
cp -rf bin/ss-* /usr/bin/

# Copy init scripts and config files
echo "Copying init scripts and config files..."
chmod a+x assets/ss-server/etc/init.d/shadowsocks-libev
cp -rf assets/ss-server/etc/init.d/shadowsocks-libev /etc/init.d/
cp -rf assets/ss-server/etc/default/shadowsocks-libev /etc/default/
mkdir -p /etc/shadowsocks-libev
cp -rf assets/ss-server/etc/shadowsocks-libev/config.json /etc/shadowsocks-libev/
update-rc.d shadowsocks-libev defaults 99
echo "Please fill up ports and passwords by yourself."
echo "Use [ /etc/init.d/shadowsocks-libev start ] to start service."