#!/bin/sh

mv /var/www/html/inc/config-me.inc.php /var/www/html/inc/config.inc.php
sed -i -e "s/^\$db_host.*$/\$db_host = 'localhost';/" /var/www/html/inc/config.inc.php
sed -i -e "s/^\$db_port.*$/\$db_port = '3306';/" /var/www/html/inc/config.inc.php
sed -i -e "s/^\$db_user.*$/\$db_user = 'powerdns';/" /var/www/html/inc/config.inc.php
sed -i -e "s/^\$db_pass.*$/\$db_pass = 'powerdns';/" /var/www/html/inc/config.inc.php
sed -i -e "s/^\$db_name.*$/\$db_name = 'powerdns';/" /var/www/html/inc/config.inc.php
sed -i -e "s/^\$db_type.*$/\$db_type = 'mysql';/" /var/www/html/inc/config.inc.php

sed -i -e 's/^launch.*/launch=gmysql/' /etc/pdns/pdns.conf
cat << EOS >> /etc/pdns/pdns.conf
gmysql-host=localhost
gmysql-user=powerdns
gmysql-password=powerdns
gmysql-dbname=powerdns
EOS
