#! /bin/bash

echo "127.0.0.1 mail.test.com" > /etc/hosts


CMD=pgrep
PPROC=mysqld_safe

if [ -n "`$CMD $PPROC`" ]
then
	echo "started"
else
	echo "starting"
	/usr/bin/mysqld_safe --defaults-file=/etc/my.cnf --user=mysql &
fi

for i in $(seq 1 5)
do
    if [ -n "`$CMD $PPROC`" ]
    then  
    	echo "$PPROC is ok"
		/usr/bin/mysql -uroot -S /var/lib/mysql/mysql.sock < vv.sql
		break
    else
        echo "$PPROC is fail"
    fi
    sleep 1
done


/etc/init.d/postfix start &
/usr/bin/supervisord -n -c /etc/supervisord.conf