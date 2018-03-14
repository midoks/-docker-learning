## 使用说明

```

docker rm -f $(docker ps -a -q)

docker build -t midoks/centos-ssh:1.0 .

docker run -d -p 1010:22 --name centos-ssh midoks/centos-ssh:1.0

docker exec -it centos-ssh /bin/bash

#window docker
winpty docker exec -it centos-ssh bash


docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")


```