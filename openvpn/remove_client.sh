#!/bin/bash

# Usage: remove_client.sh client-name

if ! ./is_running.sh
then
  echo "ERROR: ovpn not running"
  exit 1
fi

echo "Removing client $1"

if ! docker-compose run --rm openvpn ovpn_revokeclient $1 remove
then
   echo "Error revoking/removing client"
   exit 1
fi

if ! rm .ovpns/$1.ovpn 
then
   echo "No OVPN file to remove"
fi
echo "Removed client $1 and revoked keys"