#!/bin/bash

echo "Installing mysql from apt-get repository..."
apt-get update
apt-get upgrade
apt-get install mysql-server

echo "Securing mysql installation..."
mysql_secure_installation

echo "Running necessary checks..."
netstat -tap | grep mysql
service mysql restart
