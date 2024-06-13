FROM debian:11

RUN apt update -y && apt upgrade -y \
    && apt-get install procps -y \
    && apt-get install mariadb-server -y 
    # && mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld \
    # && chown -R mysql:mysql /var/lib/mysql

# ENV DB_ROOT_PASS=root_password
# ENV DB_NAME=my_database
# ENV DB_USER=my_user
# ENV DB_PASS=my_password


COPY tools/dbscript.sh /usr/local/bin/dbscript.sh

RUN chmod +x /usr/local/bin/dbscript.sh

ENTRYPOINT ["/usr/local/bin/dbscript.sh"]