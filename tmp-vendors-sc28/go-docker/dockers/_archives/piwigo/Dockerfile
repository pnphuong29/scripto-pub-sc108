# https://hub.docker.com/_/php

ARG VERSION
FROM php:${VERSION}-apache

# Convenient script to install PHP extensions
# ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# RUN chmod +x /usr/local/bin/install-php-extensions && \
	# install-php-extensions mysqli

# Use default install script of docker image PHP
RUN docker-php-ext-install mysqli

# COPY ./conf/httpd.conf /etc/apache2/apache2.conf
COPY ./conf/extra/httpd-vhosts.conf /etc/apache2/sites-available/httpd-vhosts.conf
COPY ./conf/php.ini /usr/local/etc/php/php.ini
RUN a2ensite httpd-vhosts

ENTRYPOINT [ "bash" ]
