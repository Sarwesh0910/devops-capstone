#!/bin/bash
find /home/ubuntu/backups/ -type f -name "*.log" -mtime +7 -exec rm {} \;
