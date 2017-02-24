# This project is now deprecated.

# Use the official mysql image instead.

## via docker cli

```docker run --rm  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=finger  --tmpfs=/var/lib/mysql/:rw,noexec,nosuid,size=600m --tmpfs=/tmp/:rw,noexec,nosuid,size=50m mysql:5.7```
 

## via docker-compose

```
  mysql-57:
    image: mysql:5.7
    ports:
     - "3306:3306"
    volumes:
     - "/opt/docker/mysql.conf.d:/etc/mysql/conf.d"
    environment:
     - MYSQL_ROOT_PASSWORD=finger
    tmpfs:
     - /var/lib/mysql/:rw,noexec,nosuid,size=600m
     - /tmp/:rw,noexec,nosuid,size=50m
```


/opt/docker/mysql.conf.d/custom.cnf
```
[mysqld]
  bind-address             = 0.0.0.0
  
  innodb_flush_log_at_trx_commit = 2
  innodb_lock_wait_timeout = 50

  max_connect_errors       = 1000000
  max_connections          = 900

  character-set-server           = utf8
  sql_mode                       = ""
  innodb                         = FORCE
  default-storage-engine         = InnoDB
  max_allowed_packet             = 256M
```


