#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		midoks/centos:7.1

ADD openresty.repo /etc/yum.repos.d/openresty.repo

RUN yum install -y openresty GraphicsMagick

RUN groupadd www
RUN useradd -g www www

RUN mkdir -p /www/app
RUN mkdir -p /usr/local/openresty/nginx/conf/vhost


ADD app/cc.lua /www/app
ADD conf/cc.conf /usr/local/openresty/nginx/conf/vhost
ADD conf/nginx.conf /usr/local/openresty/nginx/conf

RUN chown -R www:www /www
RUN chown -R www:www /usr/local/openresty


ADD	supervisor_openresty.conf /etc/supervisor.conf.d/supervisor_openresty.conf