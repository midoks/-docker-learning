## 使用说明

```

docker build -t midoks/openresty-rtmp:1.0 .


docker rm -f $(docker ps -a -q)

docker run -d -p 1012:80 --name openresty-rtmp midoks/openresty-rtmp:1.0

docker exec -it openresty-rtmp /bin/bash

tail -f /usr/local/openresty/nginx/logs/error.log
tail -f /usr/local/openresty/nginx/logs/access.log

/bin/openresty -c /usr/local/openresty/nginx/conf/nginx.conf

sudo sed '/^ *#/d' /usr/local/openresty/nginx/conf/nginx.conf

```