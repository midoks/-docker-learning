### Kubernetes

- linux内核需要3.10以上

```
yum install -y kubernetes
yum install -y docker


swapoff -a

/lib/systemd/system/
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
mkdir -p /opt/kubernetes/{bin,cfg}



```

### kube-node

```
```
