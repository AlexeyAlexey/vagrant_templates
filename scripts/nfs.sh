#!/usr/bin/env bash

echo "-- nfs.sh"

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -y install nfs-kernel-server
sudo apt-get update
sudo apt-get -yqq install nfs-common portmap