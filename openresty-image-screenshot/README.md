## 使用说明

```
docker build -t midoks/openresty-image-screenshot:1.0 .

docker run -d -p 1010:80 --name openresty-image-screenshot midoks/openresty-image-screenshot:1.0


docker exec -it openresty-image-screenshot /bin/bash

docker rm -f $(docker ps -a -q)

tail -f /usr/local/openresty/nginx/logs/error.log
tail -f /usr/local/openresty/nginx/logs/access.log

/bin/openresty -c /usr/local/openresty/nginx/conf/nginx.conf

sudo sed '/^ *#/d' /usr/local/openresty/nginx/conf/nginx.conf
```

### DEMO

```

http://127.0.0.1:1010/image/img1.jpg
http://127.0.0.1:1010/image/img1_100x100.jpg

```