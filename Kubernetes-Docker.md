### Kubernetes

- linux内核需要3.10以上

```
yum install -y kubernetes
yum install -y docker


swapoff -a
yum install lrzsz -y

/lib/systemd/system/
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
