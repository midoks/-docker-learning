# docker 常用命令
```
docker rm -f $(docker ps -a -q)
docker build -t midoks/centos-extmail:1.0 .
docker run -d -p 1010:22 -p 1025:25 --name centos-extmail midoks/centos-extmail:1.0 
docker exec -it centos-extmail /bin/bash


docker run -d -p 1010:22 --name centos-extmail midoks/centos-extmail:1.0  /usr/sbin/init
docker run -ti 8bf1b9537be7


#window docker
winpty docker exec -it centos-extmail bash

docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

```

## tmp
```
postfix check
postconf compatibility_level=2
postfix reload
```

## cmd
```

# send simple example
```
telnet mail.test.com 25
HELO mail

AUTH LOGIN
dGVzdC5jb20=
MTIzMTIz

MAIL FROM: <midoks@163.com>
RCPT TO: <chenjiangshan@g7.com.cn>
DATA
From:midoks@163.com
To:<chenjiangshan@g7.com.cn>
Subject:test
test
.
QUIT
```
```