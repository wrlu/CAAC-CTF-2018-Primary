#!/bin/bash
sleep 1
/etc/init.d/apache2 start
find /var/lib/mysql -type f -exec touch {} \; && service mysql start
flagfile=/var/www/html/includeAirline.sql
if [ -f $flagfile ]; then
    mysqladmin -u root password "root"
    mysql -uroot -proot < $flagfile
    rm -f $flagfile
fi

tail -f /var/log/apache2/error.log