#!/bin/bash

# TODO: test on local rpi

public_tor_hostname="$(cat /var/lib/tor/sshd/hostname)"

cat $public_tor_hostname >> "./hostnames/$1"
git add ./hostnames
git commit -m "Added hostname $1: $public_tor_hostname"
git push origin master