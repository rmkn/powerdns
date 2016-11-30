#!/bin/sh

service mysqld start
mysql -u root -e "GRANT ALL PRIVILEGES ON powerdns.* TO powerdns@localhost IDENTIFIED BY 'powerdns';"
if [ $? -eq 0 ]; then
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql powerdns < /tmp/powerdns.sql
fi
service pdns start

exec "$@"
