#!/bin/bash

## USAGE
##
## 1. Start your openvpm server
## 2. Run this script, passing in the external domain name for your server
##

# FROM https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md


if ! ./is_running.sh
then
  echo "ERROR: ovpn not running"
  exit 1
fi

server=$1

if [ -z "$server" ]
then
   echo "Pass in server name, e.g. foo.bar.com"
   exit 1

docker-compose run --rm openvpn ovpn_genconfig -u udp://$server
docker-compose run --rm openvpn ovpn_initpki
