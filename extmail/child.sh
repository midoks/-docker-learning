#! /bin/bash


CMD=pgrep
PPROC=mysqld_safe

if [ -n "`$CMD $PPROC`" ]
then
	echo "started"
else
	echo "starting"
	/usr/bin/mysqld_safe --defaults-file=/etc/my.cnf --skip-grant-tables --user=mysql &
fi


for i in $(seq 1 10)
do
	MYSQL_PING=`/usr/bin/mysqladmin -uroot ping`
	MYSQL_OK="mysqld is alive"
	echo "$i"
	echo "$MYSQL_PING,$MYSQL_OK"
  #   if [ -n "`$CMD $PPROC`" ]
  #   then  
  #   	echo "$PPROC is ok"
		# /usr/bin/mysql -uroot -S /var/lib/mysql/mysql.sock < vv.sql
  #   else
  #      echo "$PPROC is fail"
  #   fi

    if [[ "$MYSQL_PING" != "$MYSQL_OK" ]]
    then
    	echo "$PPROC is fail"
    else
    	echo "$PPROC is ok"
    	echo "/usr/bin/mysql -uroot -S /var/lib/mysql/mysql.sock < vv.sql"
    	RET=`/usr/bin/mysql -uroot < vv.sql`
    	echo $RET

      /usr/bin/mysql -uroot < /usr/local/src/extmail.sql
      /usr/bin/mysql -uroot < /usr/local/src/init.sql

    	break
    fi

    sleep 2
done
