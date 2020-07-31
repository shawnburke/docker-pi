#! /bin/bash

state=$(docker inspect openvpn --format '{{.State.Status}}')

[ "$state" != "running" ] && echo "State: $state" && exit 1;

exit 0;
