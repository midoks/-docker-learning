#! /bin/bash

#/bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"' >> /root/config/postfix-accounts.cf

# echo $(doveadm pw -s SHA512-CRYPT -u root -p root)  >> /root/config/postfix-accounts.cf

PATH=$PATH:/Users/midoks/Desktop/lib/bin
PATH=$PATH:/usr/local/lib:/usr/local/opt/m4/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/local/bin:/opt/local/sbin:::/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:USE_ZEND_DTRACE=1:/usr/local/go/bin:/opt/X11/bin:/Applications/Wireshark.app/Contents/MacOS:/Users/midoks/Desktop/lib/apache-maven-3.5.0/bin:/Users/midoks/Desktop/lib/bin:/Applications/mdserver/bin/mysql/bin:/Users/midoks/go/bin


docker exec -it mail /bin/bash