#! /bin/bash

state=$(docker inspect openvpn --format '{{.State.Status}}')

[ "$state" != "running" ] && exit 1;

exit 0;