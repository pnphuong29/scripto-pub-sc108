# https://hub.docker.com/_/httpd

ARG VERSION
FROM httpd:${VERSION}

COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./conf/extra/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

ENTRYPOINT [ "bash" ]
