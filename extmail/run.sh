#! /bin/bash

echo "127.0.0.1 mail.test.com" > /etc/hosts
echo "127.0.0.1 test.com" > /etc/hosts


/bin/sh /child.sh > /t.log

hostname mail.test.com

/etc/init.d/postfix start &

/usr/bin/supervisord -n -c /etc/supervisord.conf