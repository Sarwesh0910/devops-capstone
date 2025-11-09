#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/home/ubuntu/backups"
LOG_FILE="$BACKUP_DIR/cleanup.log"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Log start of cleanup
echo "Cleanup started at $TIMESTAMP" >> "$LOG_FILE"

# Find and delete old log files, log each deletion
find "$BACKUP_DIR" -type f -name "*.log" -mtime +7 -print -exec rm {} \; >> "$LOG_FILE"

# Log completion
echo "Cleanup completed at $(date +"%Y%m%d_%H%M%S")" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"
