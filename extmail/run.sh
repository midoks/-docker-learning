#! /bin/bash

echo "127.0.0.1 mail.extmail.org" > /etc/hosts

rsyslogd
cd /usr/local/src/courier-authlib-0.62.4 \
	&& chmod +x courier-authlib.sysvinit \
	&& ./courier-authlib.sysvinit start

/bin/sh /child.sh > /t.log

mkdir -p /mail

/etc/init.d/postfix start &
/usr/bin/supervisord -n -c /etc/supervisord.conf