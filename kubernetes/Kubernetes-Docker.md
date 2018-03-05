### Kubernetes

- linux内核需要3.10以上

```
yum install -y kubernetes
yum install -y docker
yum install -y flannel


swapoff -a
yum install lrzsz -y
yum install net-tools -y



systemctl stop firewalld
systemctl disable firewalld
systemctl stop iptables-services firewalld
systemctl disable iptables-services firewalld

lsof -i:8080



iptables -F
iptables -X
iptables -Z

iptables -S -t nat

echo "export PATH=$PATH:/opt/kubernetes/bin" >> /etc/profile
source /etc/profile

```


```
wget -O /etc/yum.repos.d/Centos-7.repo http://mirrors.aliyun.com/repo/Centos-7.repo
```

### etcd 安装
```
yum install -y etcd

vi /etc/default/etcd

ETCD_DATA_DIR="/var/lib/etcd/default"
ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"
ETCD_ADVERTISE_CLIENT_URLS="http://0.0.0.0:2379"


service etcd restart
```

### kube-master

```
systemctl stop firewalld && systemctl disable firewalld
setenforce 0

mkdir -p /opt/kubernetes/{bin,cfg}


./apiserver.sh 192.168.187.132 http://192.168.187.132:2379

./scheduler.sh 192.168.187.132

./controller-manager.sh 192.168.187.132

```

### kube-node

```
mkdir -p /opt/kubernetes/{bin,cfg}

./kubelet.sh 192.168.187.132 192.168.187.133 10.10.10.2
./proxy.sh 192.168.187.132 192.168.187.133


```



# FAQ

- error: failed to run Kubelet: failed to create kubelet: misconfiguration: kubelet cgroup driver: "cgroupfs" is different from docker cgroup driver: "systemd"

```
vim /lib/systemd/system/docker.service
将 --exec-opt native.cgroupdriver=systemd  修改为：
--exec-opt native.cgroupdriver=cgroupfs
systemctl daemon-reload 
systemctl restart docker.service
kubelet显示正常
```

### Fix
```
docker pull registry.cn-hangzhou.aliyuncs.com/google-containers/pause-amd64:3.0
docker tag registry.cn-hangzhou.aliyuncs.com/google-containers/pause-amd64:3.0 \
gcr.io/google-contaners/pause-amd64:3.0

--pod-infra-container-image=registry.cn-hangzhou.aliyuncs.com/google-containers/pause-amd64:3.0


curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://04be47cf.m.daocloud.io
```


### Demo
```
kubectl run nginx --image=nginx --replicas=3

kubectl get nodes
```


### master
```
master运行三个组件：
apiserver：作为kubernetes系统的入口，封装了核心对象的增删改查操作，以RESTFul接口方式提供给外部客户和内部组件调用。它维护的REST对象将持久化到etcd（一个分布式强一致性的key/value存储）。
scheduler：负责集群的资源调度，为新建的pod分配机器。这部分工作分出来变成一个组件，意味着可以很方便地替换成其他的调度器。
controller-manager：负责执行各种控制器，目前有两类：
endpoint-controller：定期关联service和pod(关联信息由endpoint对象维护)，保证service到pod的映射总是最新的。
replication-controller：定期关联replicationController和pod，保证replicationController定义的复制数量与实际运行pod的数量总是一致的
```

### slave
```
slave(称作minion)运行两个组件：
kubelet：负责管控docker容器，如启动/停止、监控运行状态等。它会定期从etcd获取分配到本机的pod，并根据pod信息启动或停止相应的容器。同时，它也会接收apiserver的HTTP请求，汇报pod的运行状态。
proxy：负责为pod提供代理。它会定期从etcd获取所有的service，并根据service信息创建代理。当某个客户pod要访问其他pod时，访问请求会经过本机proxy做转发。
```