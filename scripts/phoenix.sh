#!/usr/bin/env bash

echo "-- phoenix.sh"
  
# https://elixir-lang.org/install.html#unix-and-unix-like
# https://hexdocs.pm/phoenix/installation.html

sudo apt-get update

echo "-- mix local.hex"

mix local.hex --force

echo "-- strart installing phoenix version $1"

mix archive.install hex phx_new $1 --force

echo "-- start inotify-tools (for linux users)"

sudo apt-get -y install inotify-tools

echo "-- end inotify-tools (for linux users)"

echo "-- end phoenix.sh"