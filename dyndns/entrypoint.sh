#! /bin/bash

while true
do
      echo $(date);
      /usr/bin/dynroute --debug -o -d ${DOMAIN} -z ${ZONE} --awskeys /mnt/aws -o 
      sleep ${REFRESH};
done