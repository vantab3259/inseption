#!/bin/bash

# my_print_defaults
# mariadb-install-db --user=mysql \
#                     --basedir=/usr || exit 1
                    ## --datadir=/var/lib/mysql

mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld 
chown -R mysql:mysql /var/lib/mysql


mysqld --user=root --bootstrap << EOF
    FLUSH PRIVILEGES;
    # DROP DATABASE $DB_NAME;
    CREATE DATABASE IF NOT EXISTS $DB_NAME;
    CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
    GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' identified by '$DB_PASS';
    FLUSH PRIVILEGES;
EOF

exec mysqld_safe --user=mysql --console --skip-name-resolve --skip-networking=0 $@

echo "db finish"