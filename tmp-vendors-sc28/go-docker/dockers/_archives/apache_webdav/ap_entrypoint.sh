#!/usr/bin/env bash

# Grant RW permissions to WebDAV DB for all client sessions to have RW permissions
mkdir -p /usr/local/apache2/var
# chown www-data.www-data /usr/local/apache2/var
chown albert.albert /usr/local/apache2/var

# chown www-data.www-data /usr/local/apache2/conf/.htpasswd_basic
# chown www-data.www-data /usr/local/apache2/conf/.htpasswd_digest
# chown -R www-data.www-data /sc28/apache-webdav/logs

# mkdir -p /var/www/webdav
# chmod 777 /var/www/webdav
# chown -R www-data.www-data /var/www/webdav

# sed -i'' 's@#LoadModule auth_digest_module@LoadModule auth_digest_module@' /usr/local/apache2/conf/httpd.conf
# sed -i'' 's@#LoadModule dav_module@LoadModule dav_module@' /usr/local/apache2/conf/httpd.conf
# sed -i'' 's@#LoadModule dav_fs@LoadModule dav_fs@' /usr/local/apache2/conf/httpd.conf
# sed -i'' 's@#LoadModule dav_lock@LoadModule dav_lock@' /usr/local/apache2/conf/httpd.conf
# sed -i'' 's@#Include conf/extra/httpd-dav@Include conf/extra/httpd-dav@' /usr/local/apache2/conf/httpd.conf

# bash
httpd-foreground
