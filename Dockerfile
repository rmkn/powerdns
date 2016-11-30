FROM rmkn/php
MAINTAINER rmkn
RUN yum -y install epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum -y install php-mcrypt php-pdo php-mysql mysql-server pdns pdns-backend-mysql

RUN curl -o /tmp/poweradmin.tar.gz -SL http://jaist.dl.sourceforge.net/project/poweradmin/poweradmin-2.1.7.tgz \
        && tar xzf /tmp/poweradmin.tar.gz -C /var/www/html/ --strip=1

COPY entrypoint.sh /
COPY powerdns.sql init.sh /tmp/
RUN /tmp/init.sh

VOLUME /var/lib/mysql/powerdns

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

ENTRYPOINT ["/entrypoint.sh"]
