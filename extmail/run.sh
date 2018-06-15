#! /bin/bash

echo "127.0.0.1 mail.test.com" > /etc/hosts

/etc/init.d/postfix start &
/usr/bin/mysqld_safe --defaults-file=/etc/my.cnf --user=mysql &
/usr/bin/supervisord -n -c /etc/supervisord.conf