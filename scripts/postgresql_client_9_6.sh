#!/usr/bin/env bash

sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | 
sudo apt-key add -
sudo apt-get update

sudo apt-get -y install postgresql-client-9.6 libpq-dev