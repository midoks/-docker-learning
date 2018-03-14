#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		midoks/centos-ssh:1.0


RUN mkdir -p /www/source

RUN yum install -y readline-devel pcre-devel openssl-devel gcc tcl libxml*

RUN wget -O /www/source/openresty-1.13.6.1.tar.gz https://openresty.org/download/openresty-1.13.6.1.tar.gz

RUN tar -zxvf /www/source/openresty-1.13.6.1.tar.gz -C /www/source/


RUN cd /www/source/openresty-1.13.6.1 && ./configure \
--prefix=/usr/local/openresty && gmake && gmake install


ADD php-7.2.3.tar.gz /www/source


RUN cd /www/source/php* && ./configure \
--prefix=/usr/local/php \
--exec-prefix=/usr/local/php \
--with-config-file-path=/usr/local/php/etc \
--without-iconv \
--enable-zip \
--enable-mbstring \
--enable-opcache \
--enable-sockets \
--enable-ftp \
--enable-wddx \
--enable-soap \
--disable-posix \
--with-mysql-sock=/tmp/mysql.sock \
--enable-embedded-mysqli \
--with-mysqli=mysqlnd \
--enable-mysqlnd \
--with-pdo-mysql=mysqlnd \
--enable-fpm && make && make install






RUN groupadd www
RUN useradd -g www www

RUN mkdir -p /www/app 
RUN mkdir -p /www/conf

ADD index.php /www/app

ADD conf/nginx.conf /usr/local/openresty/nginx/conf
ADD conf/http.conf /www/conf


RUN chown -R www:www /www/app
RUN chown -R www:www /www/conf

ADD	supervisor_openresty.conf /etc/supervisor.conf.d/supervisor_openresty.conf