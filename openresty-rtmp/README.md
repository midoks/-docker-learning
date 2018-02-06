## 使用说明

```
docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

docker rm -f $(docker ps -a -q)

docker build -t midoks/openresty-rtmp:1.0 .


docker run -d -p 1935:1935 -p 1012:80 --name openresty-rtmp midoks/openresty-rtmp:1.0

docker exec -it openresty-rtmp /bin/bash

docker start openresty-rtmp 

#window docker
winpty docker exec -it openresty-rtmp bash

tail -f /usr/local/openresty/nginx/logs/error.log
tail -f /usr/local/openresty/nginx/logs/access.log

/bin/openresty -c /usr/local/openresty/nginx/conf/nginx.conf

sudo sed '/^ *#/d' /usr/local/openresty/nginx/conf/nginx.conf


#https://www.jianshu.com/p/224732eb42c3
/usr/local/bin/ffmpeg -re -i /www/app/test.mp4 -c copy -f flv \
rtmp://localhost:1935/live/film


```