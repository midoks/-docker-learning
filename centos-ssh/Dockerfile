#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		midoks/centos:7.1

RUN yum install passwd openssl openssh-server -y

RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''


RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
#RUN sed -i "s/UsePAM.*/UsePAM yes/g" /etc/ssh/sshd_config

#setting password
RUN echo '123123' | passwd root --stdin


RUN sh  /sbin/sshd -D &
#CMD  ["/sbin/sshd ","-D"]