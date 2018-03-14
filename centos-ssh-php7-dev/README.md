## 使用说明

```

docker rm -f $(docker ps -a -q)

docker build -t midoks/centos-ssh-php7-dev:1.0 .

docker run -d -p 1010:22 -p 8080:80 --name centos-ssh-php7-dev midoks/centos-ssh-php7-dev:1.0

docker exec -it centos-ssh-php7-dev /bin/bash

#window docker
winpty docker exec -it centos-ssh bash


docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

tailf /usr/local/openresty/nginx/logs/error.log
tailf /usr/local/php/var/log/php-fpm.log

```