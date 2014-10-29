# tmpfs-mysql
#
# VERSION               0.0.1

FROM mysql:5.7

ENV TMPFS_SIZE 4000

RUN apt-get update
RUN apt-get -y install psmisc eatmydata

# Add custom config
RUN mkdir -p /etc/mysql/conf.d
COPY custom.cnf /etc/mysql/conf.d/custom.cnf
RUN mv /usr/local/mysql/support-files/my-default.cnf /etc/mysql/my.cnf
RUN echo "!includedir /etc/mysql/conf.d/" >> /etc/mysql/my.cnf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
RUN chmod +x /entrypoint.sh

RUN mkdir -p /opt/tmpfs
RUN chown mysql: /opt/tmpfs -R
RUN mysql_install_db --user=mysql --insecure --datadir=/opt/tmpfs --basedir=/usr/local/mysql/
 
COPY setup.sql /var/tmp/setup.sql
RUN /usr/local/mysql/support-files/mysql.server start && mysql -e 'source /var/tmp/setup.sql' && killall mysqld && rm /var/tmp/setup.sql

EXPOSE 3306
CMD ["mysqld"]
