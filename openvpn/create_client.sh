#!/bin/bash

# USAGE: create_client.sh client-name [nopass]

if ! ./is_running.sh
then
  echo "ERROR: ovpn not running"
  exit 1
fi

if [ -z "$1" ]
then
  echo "Client name required"
  exit 1;
fi

nopass=

if [ "$2" == "nopass" ]
then
    nopass=nopass
fi

echo "Creating client $1..."

if ! docker-compose run --rm openvpn easyrsa build-client-full $1 $nopass
then
    echo "ERROR creating client"
    exit 1
fi

mkdir -p .ovpns
if ! docker-compose run --rm openvpn ovpn_getclient $1 > .ovpns/$1.ovpn
then
    echo "ERROR failed to save OVPN file"
    exit 1
fi

echo "Wrote .ovpns/$1.ovpn"

