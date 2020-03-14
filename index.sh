#!/bin/bash

echo -e "deb https://deb.torproject.org/torproject.org buster main rpi" >> /etc/apt/sources.list
echo -e "deb-src https://deb.torproject.org/torproject.org buster main rpi" >> /etc/apt/sources.list

apt-get update
apt-get install tor

echo -e "HiddenServiceDir /var/lib/tor/sshd/" >> /etc/tor/torrc
echo -e "HiddenServicePort 22 127.0.0.1:22" >> /etc/tor/torrc

export SERVICE_DIR=/var/lib/tor/sshd/
mkdir $SERVICE_DIR
chmod 700 $SERVICE_DIR
chown debian-tor.debian-tor $SERVICE_DIR

systemctl enable tor
systemctl start tor

echo "===== HOSTNAME ====="
cat $SERVICE_DIR/hostname
echo "===================="
