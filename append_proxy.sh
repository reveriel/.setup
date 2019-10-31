#!/bin/bash

if [[ $# -le 0 ]]; then
    echo "usage: $0 [rcfile]"
    exit 1
fi

echo "export http_proxy=http://127.0.0.1:8118" >> $1
echo "export https_proxy=http://127.0.0.1:8118" >> $1

