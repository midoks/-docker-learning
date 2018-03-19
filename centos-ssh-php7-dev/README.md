## 使用说明

- http://www.man7.org/linux/man-pages/man2/ptrace.2.html

```

docker rm -f $(docker ps -a -q)

docker build -t midoks/centos-ssh-php7-dev:1.0 .

docker run --cap-add=SYS_PTRACE --cap-add=CHOWN --security-opt seccomp=unconfined -d -p 1010:22 -p 8080:80 --name centos-ssh-php7-dev midoks/centos-ssh-php7-dev:1.0

docker exec -it centos-ssh-php7-dev /bin/bash

#window docker
winpty docker exec -it centos-ssh bash


docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

docker run -d -p 1010:22 -p 8080:80 --name centos-ssh-php7-dev midoks/centos-ssh-php7-dev:1.0

tailf /usr/local/openresty/nginx/logs/error.log
tailf /usr/local/php/var/log/php-fpm.log

sysctl -p

```

### --add-cap

|Docker’s capabilities	|Linux capabilities	| Capability Description|
|-----------------------|-------------------|-----------------------|
|SETPCAP		|CAP_SETPCAP 	|Modify process capabilities.|
|MKNOD			|CAP_MKNOD		|Create special files using mknod(2).|
|AUDIT_WRITE	|CAP_AUDIT_WRITE	|Write records to kernel auditing log.|
|CHOWN			|CAP_CHOWN		|Make arbitrary changes to file UIDs and GIDs (see chown(2)).|
|NET_RAW		|CAP_NET_RAW	|Use RAW and PACKET sockets.|
|DAC_OVERRIDE 	|	CAP_DAC_OVERRIDE	|Bypass file read, write, and execute permission checks.|
|FOWNER			|CAP_FOWNER	Bypass |permission checks on operations that normally require the file system UID of the |process to match the UID of the file.|
|FSETID			|CAP_FSETID	|Don’t clear set-user-ID and set-group-ID permission bits when a file is modified.|
|KILL			|CAP_KILL	|Bypass permission checks for sending signals.|
|SETGID			|CAP_SETGID	|Make arbitrary manipulations of process GIDs and supplementary GID list.|
|SETUID			|CAP_SETUID	|Make arbitrary manipulations of process UIDs.|
|NET_BIND_SERVICE|CAP_NET_BIND_SERVICE	|Bind a socket to internet domain privileged ports (port numbers less than 1024).|
SYS_CHROOT		|CAP_SYS_CHROOT	|Use chroot(2), change root directory.|
SETFCAP			|CAP_SETFCAP	|Set file capabilities.|
|-------------------|
下面表格中列出的Capabilities是docker默认删除的Capabilities，用户可以通过--cap-add添加其中一个或者多个。
|-------------------|
|Docker’s capabilities	|Linux capabilities|	Capability Description|
|SYS_MODULE	CAP_SYS_MODULE	Load and unload kernel modules.
|SYS_RAWIO	CAP_SYS_RAWIO	Perform I/O port operations (iopl(2) and ioperm(2)).
|SYS_PACCT	CAP_SYS_PACCT	Use acct(2), switch process accounting on or off.
|SYS_ADMIN	CAP_SYS_ADMIN	Perform a range of system administration operations.
|SYS_NICE	CAP_SYS_NICE	Raise process nice value (nice(2), setpriority(2)) and change the nice value for arbitrary processes.
SYS_RESOURCE	CAP_SYS_RESOURCE	Override resource Limits.
SYS_TIME	CAP_SYS_TIME	Set system clock (settimeofday(2), stime(2), adjtimex(2)); set real-time (hardware) clock.
SYS_TTY_CONFIG	CAP_SYS_TTY_CONFIG	Use vhangup(2); employ various privileged ioctl(2) operations on virtual terminals.
AUDIT_CONTROL	CAP_AUDIT_CONTROL	Enable and disable kernel auditing; change auditing filter rules; retrieve auditing status and filtering rules.
MAC_OVERRIDE	CAP_MAC_OVERRIDE	Allow MAC configuration or state changes. Implemented for the Smack LSM.
MAC_ADMIN	CAP_MAC_ADMIN	Override Mandatory Access Control (MAC). Implemented for the Smack Linux Security Module (LSM).
NET_ADMIN	CAP_NET_ADMIN	Perform various network-related operations.
SYSLOG	CAP_SYSLOG	Perform privileged syslog(2) operations.
DAC_READ_SEARCH	CAP_DAC_READ_SEARCH	Bypass file read permission checks and directory read and execute permission checks.
LINUX_IMMUTABLE	CAP_LINUX_IMMUTABLE	Set the FS_APPEND_FL and FS_IMMUTABLE_FL i-node flags.
NET_BROADCAST	CAP_NET_BROADCAST	Make socket broadcasts, and listen to multicasts.
IPC_LOCK	CAP_IPC_LOCK	Lock memory (mlock(2), mlockall(2), mmap(2), shmctl(2)).
IPC_OWNER	CAP_IPC_OWNER	Bypass permission checks for operations on System V IPC objects.
SYS_PTRACE	CAP_SYS_PTRACE	Trace arbitrary processes using ptrace(2).
SYS_BOOT	CAP_SYS_BOOT	Use reboot(2) and kexec_load(2), reboot and load a new kernel for later execution.
LEASE	CAP_LEASE	Establish leases on arbitrary files (see fcntl(2)).
WAKE_ALARM	CAP_WAKE_ALARM	Trigger something that will wake up the system.
BLOCK_SUSPEND	CAP_BLOCK_SUSPEND	Employ features that can block system suspend.


### 火焰图
```


```