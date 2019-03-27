#!/usr/bin/env bash

echo "-- elixir.sh"
  
# https://elixir-lang.org/install.html#unix-and-unix-like
# https://hexdocs.pm/phoenix/installation.html

echo "-- erlang instalation"

#sudo apt-get install gnupg2 -y

sudo apt-get update

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

sudo apt-get update

sudo apt-get -y install esl-erlang
sudo apt-get -y install elixir
