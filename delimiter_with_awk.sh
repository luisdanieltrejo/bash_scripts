#/bin/bash

ls -lah | tail -n +4 | awk '{ print $9 }'
