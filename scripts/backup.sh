#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
mkdir -p /home/ubuntu/backups
cp /home/ubuntu/access.log /home/ubuntu/backups/access_$TIMESTAMP.log
