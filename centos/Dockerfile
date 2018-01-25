#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		centos:centos7.1.1503

ENV TZ "Asia/Shanghai"

RUN yum install -y yum-utils
RUN yum-config-manager --add-repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum install -y deltarpm
RUN yum install -y epel-release

#RUN sed -i 's/$releasever/6/g' /etc/yum.repos.d/Centos-7.repo

RUN rpm --rebuilddb && \
	yum install -y python curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man  && \
    yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel

RUN yum install -y --enablerepo=epel pwgen python-pip

RUN yum clean all

EXPOSE 22