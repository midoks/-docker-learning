#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		midoks/centos:7.1

ENV LANG "C.UTF-8"

RUN mkdir -p /www/source


RUN yum install -y readline-devel pcre-devel openssl-devel gcc tcl

RUN wget -O /www/source/openresty-1.13.6.1.tar.gz https://openresty.org/download/openresty-1.13.6.1.tar.gz
RUN wget -O /www/source/nginx-rtmp-module.tar.gz https://github.com/arut/nginx-rtmp-module/archive/v1.2.1.tar.gz

RUN tar -zxvf /www/source/openresty-1.13.6.1.tar.gz -C /www/source/
RUN tar -zxvf /www/source/nginx-rtmp-module.tar.gz -C /www/source/


RUN cd /www/source/openresty-1.13.6.1 && ./configure \
--prefix=/usr/local/openresty \
--add-module=/www/source/nginx-rtmp-module-1.2.1 --with-http_ssl_module \
&& gmake && gmake install

RUN wget -O /www/source/ffmpeg-3.1.tar.gz http://www.ffmpeg.org/releases/ffmpeg-3.1.tar.gz
RUN tar -zxvf /www/source/ffmpeg-3.1.tar.gz -C /www/source/

#RUN wget -O /www/source/yasm-1.3.0.tar.gz http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
#RUN tar -zxvf /www/source/yasm-1.3.0.tar.gz -C /www/source/

#RUN cd /www/source/yasm-1.3.0 && ./configure \
#&& make && make install

RUN yum -y install yasm
RUN yum -y install libtool

RUN wget -O /www/source/faac-1.29.9.2.tar.gz https://sourceforge.net/projects/faac/files/faac-src/faac-1.29/faac-1.29.9.2.tar.gz
RUN tar -zxvf /www/source/faac-1.29.9.2.tar.gz -C /www/source/

RUN cd /www/source/faac-1.29.9.2 && ./configure \
&& make && make install


RUN wget -O /www/source/lame-3.100.tar.gz https://jaist.dl.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
RUN tar -zxvf /www/source/lame-3.100.tar.gz -C /www/source/

RUN cd /www/source/lame-3.100 && ./configure \
&& make && make install


RUN wget -O /www/source/last_x264.tar.bz2 ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
RUN tar -jxvf /www/source/last_x264.tar.bz2 -C /www/source/

#RUN yum install -y nasm

RUN cd /www/source/x264* && ./configure --prefix=/usr/local \
--disable-asm \
&& make && make install


RUN cd /www/source/ffmpeg-3.1 && ./configure \
--prefix=/usr/local \
--enable-gpl --enable-version3 --enable-nonfree --enable-shared \
--enable-zlib --enable-bzlib --enable-libmp3lame  \
--enable-pic --enable-libfaac \
&& make && make install

# --enable-libx264

RUN echo "/usr/local/lib/" > /etc/ld.so.conf.d/lib.conf
RUN ldconfig -v

RUN groupadd www
RUN useradd -g www www

RUN mkdir -p /www/app
RUN mkdir -p /www/conf

RUN echo "hello world!!!" > /www/app/index.html

ADD conf/nginx.conf /usr/local/openresty/nginx/conf
ADD conf/http.conf /www/conf
ADD conf/rtmp.rw /www/conf

RUN wget -O /www/app/test.mp4 http://img.ksbbs.com/asset/Mon_1703/d30e02a5626c066.mp4

RUN chown -R www:www /www/app
RUN chown -R www:www /www/conf

ADD	supervisor_openresty.conf /etc/supervisor.conf.d/supervisor_openresty.conf
ADD	supervisor_mp4_push.conf /etc/supervisor.conf.d/supervisor_mp4_push.conf

