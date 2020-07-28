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

backup_volume=/mnt/backup
while true
do
     echo "Starting sync: $(date)" 

     # List the remotes
     # then execute sync on them one at a time
     remotes=$(rclone listremotes)
     echo "$remotes" | while read p; do 
          remote_name=$(echo $p | grep -oE [^:]+)

          # example dir for gdrive is /mnt/backup/gdrive
          target="$backup_volume/$remote_name"
          echo "Syncing $remote_name"
          if ! rclone sync $remote_name: $target
          then
               echo "Error syncing remote $remote_name! (Exit Code=$?)"
          fi
     done
     sleep ${refresh}
done


