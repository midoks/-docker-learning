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