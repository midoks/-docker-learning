## 使用说明

```

docker build -t midoks/openresty-cc-tpl:1.0 .


docker run -d -p 1011:1011 --name openresty-cc-tpl midoks/openresty-cc-tpl:1.0

docker exec -it openresty-cc-tpl /bin/bash

docker rm -f $(docker ps -a -q)

tail -f /usr/local/openresty/nginx/logs/error.log
tail -f /usr/local/openresty/nginx/logs/access.log

/bin/openresty -c /usr/local/openresty/nginx/conf/nginx.conf

sudo sed '/^ *#/d' /usr/local/openresty/nginx/conf/nginx.conf

```