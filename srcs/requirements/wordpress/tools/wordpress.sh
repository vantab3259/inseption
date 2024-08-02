#!/bin/bash

lock_file="/var/www/html/.setup_complete"

# rm "/var/www/html/.setup_complete"
# rm -rf /var/www/html/*

if [ ! -f $lock_file ]; then
    cd /var/www/html
    # wp db reset --yes --allow-root
    wp core download --allow-root
    rm -f /var/www/html/wp-config.php
    wp config create --dbname=$DB_NAME --dbhost=$DB_HOST --dbuser=$DB_USER --dbpass=$DB_PASS --allow-root --skip-check

    # until wp db check --path=/var/www/html --quiet --allow-root; do
    until wp db check --path=/var/www/html --allow-root; do
        echo "Waiting for MySQL..."
        sleep 1
    done

    wp core install --url="mudoh.42.fr" --title="wordpress a l'eau" --admin_user=$WP_ADMIN_USER --admin_password=$WP_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_USER $WP_EMAIL --role=subscriber --user_pass=$WP_PASSWORD --allow-root
    wp theme install twentyseventeen --activate --allow-root
    wp post delete $(wp post list --format=ids --allow-root) --allow-root
    wp post create --post_type=post --post_title="Hello Inception!" --post_content="lol" --post_status=publish --allow-root

    echo "WordPress setup completed."

    touch $lock_file
else
    echo "WordPress setup has already been run, skipping..."
fi

exec php-fpm7.4 -F