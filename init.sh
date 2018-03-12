#!/bin/sh

sed -i -e 's/^launch.*/launch=gmysql/' /etc/pdns/pdns.conf
cat << EOS >> /etc/pdns/pdns.conf
gmysql-host=localhost
gmysql-user=powerdns
gmysql-password=powerdns
gmysql-dbname=powerdns
EOS
