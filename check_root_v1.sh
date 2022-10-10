#!/bin/bash

ROOT_UID=0
EXIT_NOTROOT=67

if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "You must be root to run this script."
else
	echo "You're root, let's continue with the script"
exit $EXIT_NOTROOT
fi
