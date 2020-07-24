#!/bin/bash 


days=3

if [ -n "$1" ] 
then
  days=$1
fi


candidates=$(docker images --filter "dangling=true" --format '{{.ID}}')
count=$(echo "$candidates" | wc -l) 

if [[ "$count" -lt $days ]] 
then 
  exit 0
fi

candidates=$(echo "$candidates" | tail -n "+$days")

echo "Cleaning up $(echo "$candidates" | wc -l) dangling containers..."

echo "$candidates" | xargs docker rmi \;

echo "Done."
