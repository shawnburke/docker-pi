#!/usr/bin/env bash

refresh=$REFRESH

if [ -z "$refresh" ]
then
     refresh=$1
fi

if [ -z "$refresh" ]
then
     refresh=3d
fi

while true
do
     echo "Starting sync: $(date)" 
     time rclone sync gdrive: /mnt/gdrive >/var/log/last-rclone-gdrive.log 
     sleep ${refresh}
done


