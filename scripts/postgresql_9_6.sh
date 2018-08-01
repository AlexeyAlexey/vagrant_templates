#!/usr/bin/env bash

echo "-- db_script.sh"

sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | 
sudo apt-key add -
sudo apt-get update


echo "-- updating package lists"
apt-get update
# gotta put this before the upgrade, b/c it reboots and then all commands are lost
echo "-- installing postgres"
apt-get -y install postgresql-9.6
# fix permissions

echo "-- fixing listen_addresses on postgresql.conf"
sudo sed -i "s/#listen_address.*/listen_addresses '*'/" /etc/postgresql/9.6/main/postgresql.conf

echo "-- fixing postgres pg_hba.conf file"
# replace the ipv4 host line with the above line
sudo cat >> /etc/postgresql/9.6/main/pg_hba.conf <<EOF
# Accept all IPv4 connections - FOR DEVELOPMENT ONLY!!!
host    all         all         0.0.0.0/0             md5
EOF

echo "-- restart postgres"
sudo /etc/init.d/postgresql restart

echo "-- creating postgres vagrant role with password vagrant"
# Create Role and login
sudo su postgres -c "psql -c \"CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'\" "

echo "-- creating database"
# Create WTM database
# sudo su postgres -c "createdb -O rolename dbname"
sudo su postgres -c "createdb -E UTF8 -O 'vagrant' 'vagrant'"

# Setting password for postgres user
sudo su postgres -c "psql -c \"ALTER USER postgres PASSWORD 'postgres'\" "

echo "-- end db_script.sh"


