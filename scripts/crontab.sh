#!/bin/bash

# Define your cron jobs
cat <<EOF > mycron
# Backup every day at midnight
0 0 * * * /home/ubuntu/scripts/backup.sh

# Cleanup every Sunday
0 0 * * 0 /home/ubuntu/scripts/cleanup.sh
EOF

# Install the new cron jobs
crontab mycron
rm mycron

echo "Crontab installed successfully."
