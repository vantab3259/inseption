#!/bin/bash
mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld 
chown -R mysql:mysql /var/lib/mysql

mysqld --user=mysql --bootstrap << EOF
    CREATE DATABASE IF NOT EXISTS $DB_NAME;
    CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
    GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
    GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASS';
    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASS');
    USE $DB_NAME;
EOF

exec mysqld_safe 