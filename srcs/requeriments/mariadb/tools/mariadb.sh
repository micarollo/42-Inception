#! /bin/bash

service mariadb start

if [ ! -d /var/lib/mysql/${DB_NAME} ];
then
	mysql -u root -e "CREATE DATABASE $DB_NAME;"
	mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;"
	mysql -u root -e "CREATE USER '$DB_ROOT_USER'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
	mysql -u root -e "FLUSH PRIVILEGES;"
fi

service mariadb stop
exec "$@"
