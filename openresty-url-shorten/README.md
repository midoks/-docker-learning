## 使用说明

```
docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

docker rm -f $(docker ps -a -q)

docker build -t midoks/openresty-url-shorten:1.0 .


docker run -d -p 1013:80 --name openresty-url-shorten midoks/openresty-url-shorten:1.0

docker exec -it openresty-url-shorten /bin/bash

docker start openresty-url-shorten

#window docker
winpty docker exec -it openresty-url-shorten bash

tail -f /usr/local/openresty/nginx/logs/error.log
tail -f /usr/local/openresty/nginx/logs/access.log

/bin/openresty -c /usr/local/openresty/nginx/conf/nginx.conf

sudo sed '/^ *#/d' /usr/local/openresty/nginx/conf/nginx.conf


```