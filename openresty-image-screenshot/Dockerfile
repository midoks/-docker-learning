#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		alpine

ENV TZ "Asia/Shanghai"

RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main" > /etc/apk/repositories

#--no-cache --virtual .build-deps
RUN apk add --no-cache\
    bash \
    linux-headers \
    autoconf \
    gcc \
    g++ \
    make \
    cmake \
    pcre-dev \
    libc-dev \
    jpeg-dev \
    libpng-dev \
    gd-dev \
    openssl-dev \
    file \
    pkgconf \
    supervisor \
    python \
    dpkg-dev dpkg \
    build-base

RUN mkdir -p /www/source

RUN wget -O /www/source/openresty-1.13.6.1.tar.gz https://openresty.org/download/openresty-1.13.6.1.tar.gz \
    && tar -zxvf /www/source/openresty-1.13.6.1.tar.gz -C /www/source \
    && cd /www/source/openresty-1.13.6.1/ && ./configure --prefix=/usr/local/openresty \
	&& make && make install

RUN wget -O /www/source/GraphicsMagick-1.3.tar.gz http://78.108.103.11/MIRROR/ftp/GraphicsMagick/1.3/GraphicsMagick-1.3.tar.gz 

RUN tar -zxvf /www/source/GraphicsMagick-1.3.tar.gz -C /www/source \
    && cd /www/source/GraphicsMagick-1.3 && ./configure && make && make install
    


RUN mkdir -p /www/app \
	&& mkdir -p /www/app/image \
	&& mkdir -p /www/app/thumbnail \
	&& mkdir -p /www/cmd

ADD app/image/img1.jpg /www/app/image
ADD app/image/img2.jpg /www/app/image
ADD app/image/img3.jpg /www/app/image
ADD app/image/img4.jpg /www/app/image
ADD app/image/img5.jpg /www/app/image
ADD app/404.lua /www/app
ADD app/curl.lua /www/app
ADD app/format.lua /www/app
ADD app/quality.lua /www/app
ADD app/tclip.lua /www/app
ADD app/thumb.lua /www/app
ADD app/thumb_fixed.lua /www/app
ADD app/index.html /www/app


#opencv install https://github.com/opencv/opencv/archive/2.4.9.tar.gz
#ADD opencv-2.4.9.tar.gz /www/
#RUN tar zxvf /www/opencv-2.4.9.tar.gz
#RUN cd /www/opencv-2.4.9/ && cmake CMakeLists.txt && make -j $(cat /proc/cpuinfo|grep processor|wc -l) && make install

ADD cmd/tclip.sh /www/cmd
ADD cmd/tclip.cpp /www/cmd

#RUN chmod +x /www/cmd/tclip.sh
# RUN echo "/usr/local/lib/" > /etc/ld.so.conf.d/opencv.conf
# RUN ldconfig -v


# ENV PKG_CONFIG_PATH=/usr/lib/pkgconfig/:/usr/local/lib/pkgconfig

# RUN cd /www/cmd && /bin/sh tclip.sh
# RUN cd /www/cmd && cp -f tclip /bin


ADD lua-resty-gm/lib /usr/local/openresty/lualib/resty/
RUN mkdir -p /usr/local/openresty/nginx/conf/vhost
ADD conf/nginx.conf /usr/local/openresty/nginx/conf


ADD supervisord.conf /etc/supervisord.conf    
ADD supervisor_openresty.conf /etc/supervisor.d/supervisor_openresty.conf

EXPOSE 22

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]