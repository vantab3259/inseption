#!/bin/bash
# init.sh

chown -R www-data:www-data /var/www/yolo
chmod -R 755 /var/www/yolo

echo wsh
nginx -g "daemon off;"
