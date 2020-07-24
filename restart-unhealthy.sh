#!/bin/bash 
TZ='America/Los_Angeles'
docker ps --format "{{json .}}" | jq -r '.Names + " " + .Status' | grep unhealthy | awk '{print $1'} | \
   while read p; \
     do \
        (cd $p; echo "$(date) -- Restarting $p">>~/docker/restart.log; \
         docker-compose restart); \
     done

