#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/home/ubuntu/backups"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Copy access.log from Docker container to backup folder with timestamp
docker cp app:/app/access.log "$BACKUP_DIR/access_$TIMESTAMP.log"

# Optional: Log the backup operation
echo "Backup completed at $TIMESTAMP" >> "$BACKUP_DIR/backup.log"
