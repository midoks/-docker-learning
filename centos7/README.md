## 使用说明

```
docker build -t midoks/centos:7.1 .


docker run -d -p 1001:22 --name centos midoks/centos:7.1

docker exec -it centos /bin/bash

winpty docker exec -it centos bash

```