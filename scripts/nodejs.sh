#!/usr/bin/env bash

echo "-- nodejs_$1_x.sh"

curl -sL "https://deb.nodesource.com/setup_$1.x" | sudo -E bash -
sudo apt-get install -y nodejs

echo "-- end nodejs_$1_x.sh"