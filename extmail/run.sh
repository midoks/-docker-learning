#! /bin/bash

echo "127.0.0.1 mail.extmail.org" > /etc/hosts

rsyslogd

/bin/sh /child.sh > /t.log

/etc/init.d/postfix start &
/usr/bin/supervisord -n -c /etc/supervisord.conf