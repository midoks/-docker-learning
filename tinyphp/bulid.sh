#! /bin/sh

CONTAINERID="forkliftservice_forklift_1"
PHP_DIR="/usr/local/php71"
NGINX_DIR="/usr/local/nginx"


PWD=`pwd`
TARGET=$PWD/root

mkdir -p $TARGET
mkdir -p $TARGET/tmp
mkdir -p $TARGET/root
mkdir -p $TARGET/usr
mkdir -p $TARGET/bin
mkdir -p $TARGET/lib
mkdir -p $TARGET/lib64
mkdir -p $TARGET/sbin
mkdir -p $TARGET/var


### PHP start ###
echo docker exec -it $CONTAINERID /usr/bin/ldd $PHP_DIR/bin/php
php_link=`docker exec -it $CONTAINERID /usr/bin/ldd $PHP_DIR/bin/php`

for i in $php_link
do
	echo $i,"\n"
done


# echo docker cp –L $CONTAINERID:/lib64/libselinux.so.1 $TARGET
# docker cp -L 41747ed0b326:/lib64/libselinux.so.1 ./root/lib64
### PHP end ###
