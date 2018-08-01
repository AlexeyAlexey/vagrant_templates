#!/usr/bin/env bash

# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
# codename=xenial $2
# mongodb=3.6 $1

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $3/mongodb-org/$1 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-$1.list

apt-get update

apt-get install -y mongodb-org=$2 mongodb-org-server=$2 mongodb-org-shell=$2 mongodb-org-mongos=$2 mongodb-org-tools=$2

service mongod start

# Pin a specific version of MongoDB 

echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf

service mongod restart

