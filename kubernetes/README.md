## 使用说明

```
docker build -t midoks/kubernetes:1.0 .

docker rm -f $(docker ps -a -q)

docker run -d -p 1001:22 --name kubernetes midoks/kubernetes:1.0

docker exec -it kubernetes /bin/bash

winpty docker exec -it kubernetes bash

```