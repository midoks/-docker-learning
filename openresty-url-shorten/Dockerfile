#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		midoks/centos:7.1

ENV LANG "C.UTF-8"

ADD openresty.repo /etc/yum.repos.d/openresty.repo

RUN yum install -y openresty
RUN yum install -y redis


RUN groupadd www
RUN useradd -g www www

RUN mkdir -p /www/app


ADD app/ /www/app/
ADD simple-url-shorten/ /usr/local/openresty/lualib/resty/short/


ADD conf/nginx.conf /usr/local/openresty/nginx/conf


RUN chown -R www:www /www/app
RUN chown -R www:www /usr/local/openresty

RUN chown root:www /usr/local/openresty/nginx/sbin/nginx
RUN chmod 750 /usr/local/openresty/nginx/sbin/nginx
RUN chmod u+s /usr/local/openresty/nginx/sbin/nginx

ADD	supervisor_openresty.conf /etc/supervisor.conf.d/supervisor_openresty.conf
ADD	supervisor_redis.conf /etc/supervisor.conf.d/supervisor_redis.conf
