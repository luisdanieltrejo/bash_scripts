#!/bin/bash

sudo find /var/logs type -f -name *.log -exec truncate -s +
