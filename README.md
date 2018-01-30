# docker-learning


### Docker 安装
- http://www.docker.com/

### 集群相关
```

```

# Linux安装
```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

sudo yum -y makecache fast
sudo yum -y install docker-ce
sudo service docker start
```

# docker 常用命令
```
docker info
docker version
docker-compose --version
docker-machine --version

docker run -d -p 80:80 --name webserver nginx
docker ps


docker start web 					#启动容器名为web的容器
docker exec -it web /bin/bash 		#进入容器
docker stop web 					#停止容器
docker rm -f web 					#删除容器
docker rmi -f web 					#删除镜像


docker run -t -i 23ac40ed7f8b /bin/bash #进入镜像


docker stop $(docker ps -a -q) 		#停止所有的container，这样才能够删除其中的images
docker rm -f $(docker ps -a -q)	#如果想要删除所有container的话再加一个指令
docker rmi -f $(docker images |  awk "{print $3}") #删除所有镜像
docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}") #想要删除untagged images，也就是那些id为<None>的image的话可以用
```

# 镜像的操作
```
docker images
docker rmi ad673a791d21  #删除images
```


# mac
- https://docs.docker.com/docker-for-mac/
```


```