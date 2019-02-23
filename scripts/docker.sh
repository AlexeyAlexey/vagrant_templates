#!/usr/bin/env bash

apt-get -y install software-properties-common

apt-get update

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88


add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update

#  VERSION $1  18.03.0~ce-0~ubuntu
apt-get -y install docker-ce=$1

# If you would like to use Docker as a non-root user, you should now consider
# adding your user to the "docker" group with something like:

usermod -aG docker vagrant