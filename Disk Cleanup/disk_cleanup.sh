#!/bin/bash

echo "Starting temporary file cleanup..."

# Clean the /tmp directory
echo "Cleaning /tmp..."
sudo rm -rf /tmp/*

# Clean the /var/tmp directory
echo "Cleaning /var/tmp..."
sudo rm -rf /var/tmp/*

# Clean apt cache
echo "Cleaning apt cache..."
sudo apt-get clean

# Clean user thumbnails
echo "Cleaning user thumbnails..."
rm -rf ~/.cache/thumbnails/*

# Clean old logs
echo "Cleaning old logs..."
sudo find /var/log -type f -name "*.gz" -mtime +7 -exec rm -f {} \;
sudo find /var/log -type f -name "*.1" -mtime +7 -exec rm -f {} \;
sudo find /var/log -type f -name "*.old" -mtime +7 -exec rm -f {} \;

# Clean journal logs (keep only 7 days of logs)
echo "Cleaning journal logs..."
sudo journalctl --vacuum-time=7d

echo "Cleanup complete."

# Show disk usage after cleanup
echo "Disk usage after cleanup:"
df -h