# docker 常用命令
```
docker rm -f $(docker ps -a -q)
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


grant all privileges on *.* to 'root'@'%' identified by 'root';
```

## cmd

```

send simple example
-----------------------

telnet mail.test.com 25
HELO mail

AUTH LOGIN
bWlkb2tzQHRlc3QuY29t
MTIzMTIz

MAIL FROM: <midoks@163.com>
RCPT TO: <627293072@qq.com>
DATA
From:midoks@163.com
To:<chenjiangshan@g7.com.cn>
Subject:test
test
.
QUIT
```