## 使用说明

```
docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

docker rm -f $(docker ps -a -q)

docker build -t midoks/nginx-rtmp-module:1.0 .


docker run -d -p 2201:80 --name  nginx-rtmp-module midoks/nginx-rtmp-module:1.0

docker exec -it nginx-rtmp-module /bin/bash

#window docker
winpty docker exec -it nginx-rtmp-module bash

```