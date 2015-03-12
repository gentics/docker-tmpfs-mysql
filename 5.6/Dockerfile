# tmpfs-mysql
#
# VERSION               0.0.1

FROM mysql:5.6

ENV TMPFS_SIZE 4000

RUN apt-get update
RUN apt-get -y install psmisc bc openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:finger' | chpasswd
RUN sed -i 's/PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22

RUN apt-get -y install eatmydata

# Add custom config
COPY custom.cnf /etc/mysql/conf.d/custom.cnf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
RUN chmod +x /entrypoint.sh

RUN mkdir -p /opt/tmpfs
RUN chown mysql: /opt/tmpfs -R
RUN mysql_install_db --user=mysql --datadir=/opt/tmpfs 

COPY setup.sql /var/tmp/setup.sql
RUN service mysql start && mysql -e 'source /var/tmp/setup.sql' && killall mysqld && rm /var/tmp/setup.sql

EXPOSE 3306
CMD ["mysqld", "--datadir=/opt/tmpfs", "--user=mysql"]
