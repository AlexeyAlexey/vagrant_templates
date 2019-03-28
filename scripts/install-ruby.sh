#!/usr/bin/env bash

echo "-- install-ruby.sh"

source /etc/profile.d/rvm.sh

rvm use --default --install --create $1

shift

if (( $# ))
then gem install $@
fi

#rvm cleanup all

echo "-- end install-ruby.sh"