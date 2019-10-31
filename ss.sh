#!/bin/bash
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

apt install python-pip
apt install libsodium18
pip install shadowsocks
apt install privoxy

echo "forward-socks5 / 127.0.0.1:1080 ." >> /etc/privoxy/config
systemctl restart privoxy

