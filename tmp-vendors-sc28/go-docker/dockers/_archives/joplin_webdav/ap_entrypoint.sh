#!/usr/bin/env bash

rm -rf /joplin-webdav/conf/original
cp -R /usr/local/apache2/conf/original /joplin-webdav/conf/

mkdir -p /usr/local/apache2/var
chown www-data.www-data /usr/local/apache2/var

chown www-data.www-data /usr/local/apache2/conf/.htpasswd_basic
chown www-data.www-data /usr/local/apache2/conf/.htpasswd_digest
chown -R www-data.www-data /var/www/webdav

mkdir -p /sc28/joplin-webdav/logs
chown -R www-data.www-data /sc28/joplin-webdav/logs

sed -i'' "s#@{AP_PORT_JOPLIN_WEBDAV}@#${AP_PORT_JOPLIN_WEBDAV}#g" /usr/local/apache2/conf/extra/httpd-vhosts.conf
sed -i'' 's@#LoadModule auth_digest_module@LoadModule auth_digest_module@' /usr/local/apache2/conf/httpd.conf
sed -i'' 's@#LoadModule dav_module@LoadModule dav_module@' /usr/local/apache2/conf/httpd.conf
sed -i'' 's@#LoadModule dav_fs@LoadModule dav_fs@' /usr/local/apache2/conf/httpd.conf
# sed -i'' 's@#LoadModule dav_lock@LoadModule dav_lock@' /usr/local/apache2/conf/httpd.conf
# sed -i'' 's@#Include conf/extra/httpd-dav@Include conf/extra/httpd-dav@' /usr/local/apache2/conf/httpd.conf

httpd-foreground
