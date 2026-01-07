#!/bin/bash

set -euo pipefail

# Copy /backup/* to ssh remote
: "${SSH_USER:?SSH_USER is not set}"
: "${SSH_HOST:?SSH_HOST is not set}"
: "${SSH_PATH:?SSH_PATH is not set}"

# back up all files in /backup to remote via scp
echo "Starting backup upload to ${SSH_USER}@${SSH_HOST}:${SSH_PATH}"
ssh-keyscan nas.albercl.dev >> /root/.ssh/known_hosts

# ls /backups and store last modified file
last_backup=$(ls -t /backups | head -n 1)

echo "Uploading backup ${last_backup} to ${SSH_USER}@${SSH_HOST}:${SSH_PATH}"
scp -i /root/.ssh/id_ed25519 /backups/${last_backup} "${SSH_USER}@${SSH_HOST}:${SSH_PATH}"

# Remove all files in /backups
echo "Cleaning up local backups"
rm -f /backups/*

echo "Backup upload complete."