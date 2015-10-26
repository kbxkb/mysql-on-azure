#!/bin/bash

# CAUTION - This script needs the new location (full path) as parameter WITHOUT
# the "/mysql" part at the end, it will automatically create a 'mysql' directory inside
# whatever path is passed in as parameter

service mysql stop
rm -rf "$1/mysql"

sudo rsync -avzh /var/lib/mysql $1

newdir=`echo $1 | sed 's/\//\\\\\//'`
sed -i 's/^datadir\(\s*\)=\(\s*\).*$/datadir\1=\2'"$newdir\/mysql"'/' /etc/mysql/my.cnf

mv /var/lib/mysql /var/lib/mysql-old

sed -i 's/\/var\/lib/'$newdir'/' /etc/apparmor.d/usr.sbin.mysqld
/etc/init.d/apparmor reload

service mysql start
