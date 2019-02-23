#!/usr/bin/env bash

# VERSION $1 1.22.0 example
curl -L https://github.com/docker/compose/releases/download/$1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose --version

