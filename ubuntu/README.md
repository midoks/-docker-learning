## 使用说明

```
docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

docker rm -f $(docker ps -a -q)

docker build -t midoks/ubuntu:1.0 .


docker run -d -p 2200:22 --name  ubuntu midoks/ubuntu:1.0

docker exec -it ubuntu /bin/bash

#window docker
winpty docker exec -it ubuntu bash

```