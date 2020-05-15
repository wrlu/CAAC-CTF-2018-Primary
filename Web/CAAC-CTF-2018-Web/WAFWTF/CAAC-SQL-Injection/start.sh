#!/bin/bash
sleep 1
find /var/lib/mysql -type f -exec touch {} \; && service mysql start
chmod +x /root/tomcat/bin/startup.sh
/root/tomcat/bin/startup.sh
flagfile=/root/wafwtf.sql
if [ -f $flagfile ]; then
    mysqladmin -u root password "root"
    mysql -uroot -proot < $flagfile
    rm -f $flagfile
fi
tail -f /root/tomcat/conf/server.xml