#!/bin/bash

while [[ i=l ]]
do
date
df -h /boot | awk ' { print $5 " " $6 }'
df -h /home | sed -n '2p' | awk '{ print $5 " " $6 }'
df -h /var/log | awk '{ print $5 " " $6 }'
sleep 2s
echo
done

# This script will contantly run, if you want to change that behavior you could change the while condition to match your preferences
