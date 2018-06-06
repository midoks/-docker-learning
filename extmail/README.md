# docker 常用命令
```
docker rm -f $(docker ps -a -q)
docker build -t midoks/centos-extmail:1.0 .
docker run -d -p 1010:22 --name centos-extmail midoks/centos-extmail:1.0 
docker exec -it centos-extmail /bin/bash


docker run -d -p 1010:22 --name centos-extmail midoks/centos-extmail:1.0  /usr/sbin/init
docker run -ti 8bf1b9537be7


#window docker
winpty docker exec -it centos-extmail bash

docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

```