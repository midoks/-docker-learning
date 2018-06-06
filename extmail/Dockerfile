#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		centos:centos7.1.1503
# FROM 		hasedon/centos6.5
MAINTAINER  midoks <midoks@163.com>

ENV TZ "Asia/Shanghai"
#ENV LC_ALL "en_US.UTF-8"
ENV TERM xterm


ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo



RUN rpm --rebuilddb && yum install -y deltarpm && yum -y makecache fast

RUN rpm --rebuilddb && yum clean all && yum swap fakesystemd systemd -y


RUN rpm --rebuilddb && yum groupinstall "Development tools" -y

RUN rpm --rebuilddb && yum install -y --enablerepo=epel pwgen python-pip
RUN pip install --upgrade pip

RUN rpm --rebuilddb && yum install -y curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
	yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel


RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/supervisor.conf.d && \
    mkdir -p /var/log/supervisor



#extmail
RUN rpm --rebuilddb && yum install nginx vim gcc gcc-c++ openssl openssl-devel db4-devel \
	ntpdate mysql mysql-devel mysql-server bzip2 php-mysql cyrus-sasl-md5 \
	perl-GD perl-DBD-MySQL perl-GD perl-CPAN perl-CGI perl-CGI-Session \
	cyrus-sasl-lib cyrus-sasl-plain cyrus-sasl cyrus-sasl-devel \
	libtool-ltdl-devel telnet mail libicu-devel  -y


RUN groupadd -g 2525 postfix
RUN useradd -g postfix -u 2525 -s /sbin/nologin -M postfix
RUN groupadd -g 2526 postdrop
RUN useradd -g postdrop -u 2526 -s /sbin/nologin -M postdrop

RUN cd /usr/local/src/  \
	&& wget http://cdn.postfix.johnriley.me/mirrors/postfix-release/official/postfix-3.0.11.tar.gz \
	&& tar -zxvf postfix-3.0.11.tar.gz \
    && cd postfix-3.0.11 \
    && make makefiles 'CCARGS=-DHAS_MYSQL -I/usr/include/mysql -DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I/usr/include/sasl -DUSE_TLS ' 'AUXLIBS=-L/usr/lib64/mysql -lmysqlclient -lz -lrt -lm -L/usr/lib64/sasl2 -lsasl2   -lssl -lcrypto' && make

ADD postfix/Makefile /usr/local/src/postfix-3.0.11/Makefile
RUN yum -y remove sendmail

RUN cd /usr/local/src/postfix-3.0.11 && make install
ADD postfix/main.cf /etc/postfix/main.cf
ADD postfix/postfix /etc/init.d/postfix
RUN chmod +x /etc/init.d/postfix

RUN rpm --rebuilddb && yum install -y dovecot dovecot-mysql
ADD dovecot/dovecot.conf 	/etc/dovecot/conf.d/dovecot.conf
ADD dovecot/10-auth.conf 	/etc/dovecot/conf.d/10-auth.conf
ADD dovecot/10-mail.conf 	/etc/dovecot/conf.d/10-mail.conf
ADD dovecot/10-ssl.conf 	/etc/dovecot/conf.d/10-ssl.conf
ADD dovecot/10-logging.conf /etc/dovecot/conf.d/10-logging.conf
ADD dovecot/auth-sql.conf 	/etc/dovecot/conf.d/auth-sql.conf
ADD dovecot/dovecot-mysql.conf 	/etc/dovecot-mysql.conf

RUN groupadd mailusers
RUN useradd -g mailusers -s /sbin/nologin test1
RUN echo 'test1' | passwd test1 --stdin


# RUN wget https://sourceforge.net/projects/courier/files/courier-unicode/1.2/courier-unicode-1.2.tar.bz2 \
#     && tar jxvf courier-unicode-1.2.tar.bz2 \
#     && cd courier-unicode-1.2 \
#     && ./configure \
#     && make && make install
# CMD [ "/ext/init.d/init"]
EXPOSE 22
ADD run.sh run.sh
ENTRYPOINT ["/run.sh"]
