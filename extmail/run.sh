#! /bin/bash

echo "127.0.0.1 mail.test.com" > /etc/hosts

/etc/init.d/postfix start

/usr/bin/supervisord -n -c /etc/supervisord.conf