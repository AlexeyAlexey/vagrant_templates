
#!/usr/bin/env bash

echo "-- install-rvm.sh"

sudo apt-get install gnupg2 -y

gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# For a Multi-User install you would execute the following:

\curl -sSL https://get.rvm.io | sudo bash -s $1

# The Multi-User install instructions must be prefixed with the  sudo command.
#Single-User Install Location: ~/.rvm/

#If the install script is run prefixed with sudo, RVM will automatically install into /usr/local/rvm

#https://rvm.io/integration/ubuntu-on-windows
#multi-user installed in /usr/local/rvm

echo 'source /usr/local/rvm/scripts/rvm' >> ~/.bashrc

source ~/.bashrc
