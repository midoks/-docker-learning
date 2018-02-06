## 使用说明

```
docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

docker rm -f $(docker ps -a -q)

docker build -t midoks/openresty-rtmp:1.0 .


docker run -d -p 1935:1935 -p 1012:80 --name openresty-rtmp midoks/openresty-rtmp:1.0

docker exec -it openresty-rtmp /bin/bash

#window docker
winpty docker exec -it openresty-rtmp bash

tail -f /usr/local/openresty/nginx/logs/error.log
tail -f /usr/local/openresty/nginx/logs/access.log

/bin/openresty -c /usr/local/openresty/nginx/conf/nginx.conf

sudo sed '/^ *#/d' /usr/local/openresty/nginx/conf/nginx.conf

```