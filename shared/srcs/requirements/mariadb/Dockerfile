FROM debian:11

EXPOSE	3306

RUN apt update -y && apt upgrade -y \
    && apt-get install procps -y \
    && apt-get install mariadb-server -y \
    && rm -rf /var/lib/apt/lists/*\
    && mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql


# ENV DB_ROOT_PASS=root_password
# ENV DB_NAME=my_database
# ENV DB_USER=my_user
# ENV DB_PASS=my_password
COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/50.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]
