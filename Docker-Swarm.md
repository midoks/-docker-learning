### docker swarm

- https://releases.hashicorp.com/consul/0.9.2/consul_0.9.2_linux_arm64.zip

```
nohub consul agent -server -bootstrap -ui -data-dir /var/lib/consul \
-client=192.168.1.198 -bind=192.168.0.151 &>/var/log/consul.log &


```

### 升级内核

- docker需要kernel-3.10以上的内核

```
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

wget http://ftp.scientificlinux.org/linux/scientific/7.0/x86_64/updates/security/kernel-3.10.0-123.1.2.el7.x86_64.rpm

grub2-set-default 0  

```

```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
yum --enablerepo=elrepo-kernel install kernel-ml

grub2-set-default 0  

uname -sr

```