# docker 常用命令
```
docker rm -f $(docker ps -a -q)
docker build -t midoks/centos-extmail:1.0 .
docker run -d -p 1010:22 -p 1025:25 -p 1006:3306 --name centos-extmail midoks/centos-extmail:1.0 
docker exec -it centos-extmail /bin/bash

docker rm -f centos-extmail
docker build -t midoks/centos-extmail:1.0 .
docker run -d -p 1010:22 -p 1025:25 -p 1006:3306 --name centos-extmail midoks/centos-extmail:1.0 
docker exec -it centos-extmail /bin/bash


docker run --privileged -d -p 1010:22 --name centos-extmail midoks/centos-extmail:1.0  /usr/sbin/init
docker run -ti 8bf1b9537be7


#window docker
winpty docker exec -it centos-extmail bash

docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

tail –f /var/log/maillog

```

## tmp
```
postfix check
postconf compatibility_level=2
postfix reload
```

### common
```
saslpasswd2 -c -u 'test.com' test     执行之后输入2次密码就可以了
sasldblistusers2 查看添加的用户
saslpasswd2 -d "test@test.com"  删除用户

```

### 查看授权
```

SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;

```

## cmd

```

postmap -q test.com mysql:/etc/postfix/mysql_virtual_domains_maps.cf

send simple example

bWlkb2tz
-----------------------

telnet mail.extmail.org 25
HELO mail

AUTH LOGIN
bWlkb2tzQGV4dG1haWwub3Jn
MTIzMTIz

MAIL FROM: <midoks@extmail.org>
RCPT TO: <midoks@163.com>
DATA
From:midoks@test.com
To:<midoks@163.com>
Subject:test
test
.
QUIT
```