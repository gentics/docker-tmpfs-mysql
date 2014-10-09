#!/bin/bash

set -e
TMPFS_DIR=/opt/tmpfs

echo "none            $TMPFS_DIR  tmpfs   defaults,size=${TMPFS_SIZE}m,uid=999,gid=1000,mode=0700          0       0" >> /etc/fstab

# Move away old mysql data
mv $TMPFS_DIR /opt/backup

# Recreate directory
mkdir $TMPFS_DIR  && chown mysql: $TMPFS_DIR

# Mount tmpfs and add data
mount $TMPFS_DIR
mv /opt/backup/* $TMPFS_DIR

exec "$@"
