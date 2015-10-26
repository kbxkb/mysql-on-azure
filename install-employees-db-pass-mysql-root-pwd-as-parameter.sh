#!/bin/bash

echo "Creating directory to download employees database to..."
mkdir employees_sample_db; cd employees_sample_db/

echo "Downloading full database..."
wget "https://launchpad.net/test-db/employees-db-1/1.0.6/+download/employees_db-full-1.0.6.tar.bz2"

echo "Extracting..."
tar -xjf employees_db-full-1.0.6.tar.bz2
cd employees_db/

echo "Installing..."
mysql -uroot -p$1 -t < employees.sql
mysql -uroot -p$1 -e "show databases;"

echo "Done"