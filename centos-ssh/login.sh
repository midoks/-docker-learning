#!/usr/bin/expect -f


#IP=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'`

set password "123123"

spawn ssh -p1010 root@127.0.0.1

#expect "*yes/no*" {send "yes\n";interact}
expect "*password:*" {send "$password\r";interact}
