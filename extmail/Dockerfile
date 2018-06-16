#
# MAINTAINER		midoks <midoks@163.com>
# DOCKER-VERSION 	17.12.0-ce, build c97c6d6
#
# Dockerizing Ubuntu: Dockerfile for building Ubuntu images

FROM		centos:latest
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

RUN rpm --rebuilddb && yum install -y dovecot dovecot-mysql
RUN yum install -y courier-unicode

RUN pip install supervisor

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

ADD ./courier-authlib-0.62.4.tar.bz2 /usr/local/src/
RUN cd /usr/local/src/courier-authlib-0.62.4 \
	&& ./configure  --prefix=/usr/local/courier-authlib \
	    --sysconfdir=/etc \
	    --without-authpam \
	    --without-authshadow \
	    --without-authvchkpw \
	    --without-authpgsql \
	    --with-authmysql \
	    --with-mysql-libs=/usr/lib64/mysql \
	    --with-mysql-includes=/usr/include/mysql \
	    --with-redhat \
	    --with-authmysqlrc=/etc/authmysqlrc \
	    --with-authdaemonrc=/etc/authdaemonrc \
	    --with-mailuser=postfix \
	&& make && make install

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


ADD dovecot/dovecot.conf 	/etc/dovecot/conf.d/dovecot.conf
ADD dovecot/10-auth.conf 	/etc/dovecot/conf.d/10-auth.conf
ADD dovecot/10-mail.conf 	/etc/dovecot/conf.d/10-mail.conf
ADD dovecot/10-ssl.conf 	/etc/dovecot/conf.d/10-ssl.conf
ADD dovecot/10-logging.conf /etc/dovecot/conf.d/10-logging.conf
ADD dovecot/auth-sql.conf 	/etc/dovecot/conf.d/auth-sql.conf
ADD dovecot/dovecot-mysql.conf 	/etc/dovecot-mysql.conf


RUN chmod 755 /usr/local/courier-authlib/var/spool/authdaemon
RUN cd /usr/local/courier-authlib && cp /etc/authdaemonrc.dist /etc/authdaemonrc
RUN cp /etc/authmysqlrc.dist /etc/authmysqlrc
ADD courier-authlib/authdamonrc.conf /etc/authdaemonrc

RUN yum install -y mariadb mariadb-server && yum clean all
RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql

ADD sasl/smtpd.conf /usr/lib64/sasl2/smtpd.conf
ADD sasl/saslauthd.conf /etc/sysconfig/saslauthd
ADD sasl/saslauthd.service.txt /usr/lib/systemd/system/saslauthd.service

RUN groupadd mailusers
RUN useradd -g mailusers -s /sbin/nologin midoks
RUN useradd -g mailusers -s /sbin/nologin test
RUN echo '123123' | passwd midoks --stdin
RUN echo '123123' | passwd test --stdin
RUN echo "123123" | saslpasswd2 -c -u 'test.com' midoks

RUN chown postfix /etc/sasldb2
RUN chown postfix /etc/sasldb2
RUN chmod 640 /etc/sasldb2

#ADD mariadb/my.cnf /etc/my.cnf
ADD vv.sql vv.sql

ADD child.sh child.sh

ADD supervisord.conf /etc/supervisord.conf
ADD supervisor/sasl.conf /etc/supervisor.conf.d/sasl.conf

EXPOSE 22

ADD run.sh run.sh
ENTRYPOINT ["/run.sh"]
