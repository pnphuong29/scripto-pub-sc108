#!/usr/bin/env bash

rm -rf /sc28/httpd-file-server/conf/original
cp -R /usr/local/apache2/conf/original /sc28/httpd-file-server/conf/
httpd-foreground
