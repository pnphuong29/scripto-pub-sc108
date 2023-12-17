#!/bin/bash

# Enable MySQL yum repository on CentOS:
sudo rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm

# Disable all repositories in mysql repo file:
sudo sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo

# Enable MySQL 8.0 repo and install
sudo yum --enablerepo=mysql80-community install mysql-community-server

# Start MySQL service
sudo service mysqld start

# Show temporary password for root user
sudo grep "A temporary password" /var/log/mysqld.log

# Run MySQL secure installation
sudo mysql_secure_installation