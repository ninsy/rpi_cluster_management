#!/bin/bash
# TODO: proper identification so no fuckup
# TODO: exit if not sudo

apt-get update

dependencies=(
    unzip
    curl
)

for bin in ${dependencies[@]}; do
    if ! command -v unzip &> /dev/null
    then
        echo "Installing $bin..."
        apt-get update
        apt-get install $bin -y
    fi
done

tmpdir=$(mktemp -d)
curl -L https://downloads.raspberrypi.org/raspios_lite_armhf_latest -o raspian_lite_latest.zip
unzip raspian_lite_latest.zip -d $tmpdir
mv $tmpdir/*.img raspian_lite.img


rm raspian_lite_latest.zip
rmdir $tmpdir
