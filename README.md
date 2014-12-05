The main goal for this container image is to provide a very fast mysql server which may be used for integration tests or other testing purposes. The storage for this mysql server uses an internal tmpfs. The size of this tmpfs ramdisk can be configured using the **TMPFS_SIZE** environment setting. The password is currently hardcoded to *finger*. This container should only be used for testing purposes.

> Please note that this container requires privileged permissions to mount the tmpfs

Example usage:

    docker pull gentics/tmpfs-mysql
    docker run -d --cap-add=SYS_ADMIN  -e TMPFS_SIZE=300 -p 3000:3306 gentics/tmpfs-mysql:5.7
    mysql -u root -pfinger -h 127.0.0.1 -P 3000

More info https://registry.hub.docker.com/u/gentics/tmpfs-mysql/
