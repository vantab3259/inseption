#!/bin/bash
mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld 
chown -R mysql:mysql /var/lib/mysql


mysqld --user=mysql --bootstrap << EOF
    FLUSH PRIVILEGES;
    CREATE DATABASE IF NOT EXISTS $DB_NAME;
    GRANT ALL ON *.* TO 'root'@'$DB_HOST' IDENTIFIED BY '$DB_ROOT_PASS' WITH GRANT OPTION;
    GRANT ALL ON *.* TO 'root'@'%' identified by '$DB_ROOT_PASS' WITH GRANT OPTION ;
    GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' identified by '$DB_PASS' WITH GRANT OPTION ;
    SET PASSWORD FOR 'mysql'@'%'=PASSWORD('${DB_ROOT_PASS}') ;
    SET PASSWORD FOR 'root'@'%'=PASSWORD('${DB_ROOT_PASS}') ;
    SET PASSWORD FOR 'root'@'$DBHOST'=PASSWORD('${DB_ROOT_PASS}') ;
    SET PASSWORD FOR '$DB_USER'@'%' = PASSWORD('${DB_PASS}');
    FLUSH PRIVILEGES;
EOF

exec mysqld_safe 