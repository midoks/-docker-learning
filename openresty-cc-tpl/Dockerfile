#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		midoks/centos:7.1

ADD openresty.repo /etc/yum.repos.d/openresty.repo

#RUN sudo yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo


RUN yum install -y openresty GraphicsMagick


ADD	supervisor_openresty.conf /etc/supervisor.conf.d/supervisor_openresty.conf