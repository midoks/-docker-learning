#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		midoks/centos:7.1

RUN wget https://openresty.org/download/openresty-1.13.6.1.tar.gz
RUN wget https://github.com/arut/nginx-rtmp-module/archive/v1.2.1.tar.gz

#ADD	supervisor_openresty.conf /etc/supervisor.conf.d/supervisor_openresty.conf