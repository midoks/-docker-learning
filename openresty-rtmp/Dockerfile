#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		midoks/centos:7.1

RUN wget -O openresty-1.13.6.1.tar.gz https://openresty.org/download/openresty-1.13.6.1.tar.gz
RUN wget -O nginx-rtmp-module.tar.gz https://github.com/arut/nginx-rtmp-module/archive/v1.2.1.tar.gz

RUN tar -zxvf openresty-1.13.6.1.tar.gz ./openresty
RUN tar -zxvf openresty-1.13.6.1.tar.gz ./nginx-rtmp-module

#ADD	supervisor_openresty.conf /etc/supervisor.conf.d/supervisor_openresty.conf