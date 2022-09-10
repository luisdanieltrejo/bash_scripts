#!/bin/bash

# This script will perform a backup using rsync command and create a folder destination based on the date it was performed. Just replace variables as you need

## Variables ##
SOURCE=/var/log
USER=luist
DESTINATION=1.1.1.1 #Replace with remote target
REMOTE_FOLDER=/mnt/backup #Replace with remote folder
DATE=$(date '+%F')

rsync -avz $SOURCE $USER@$DESTINATION:$REMOTE_FOLDER/$DATE

echo "Backup Completed"
