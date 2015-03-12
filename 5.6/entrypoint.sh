#!/bin/bash

service ssh start

set -e
TMPFS_DIR=/opt/tmpfs

echo "Using tmpfs size: $TMPFS_SIZE"
echo "none            $TMPFS_DIR  tmpfs   defaults,size=${TMPFS_SIZE}m,uid=999,gid=999,mode=0700          0       0" >> /etc/fstab

echo "Move away old mysql data"
mv $TMPFS_DIR /opt/backup

echo "Recreate directory"
mkdir $TMPFS_DIR  && chown mysql: $TMPFS_DIR

echo "Mounting tmpfs and adding data"
mount $TMPFS_DIR
mv /opt/backup/* $TMPFS_DIR

#exec "eatmydata" "$@"
exec "$@"
