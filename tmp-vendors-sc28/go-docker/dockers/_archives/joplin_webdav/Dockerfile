# https://hub.docker.com/_/httpd
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM httpd:${VERSION}

COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./conf/extra/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
COPY ./conf/.htpasswd_basic /usr/local/apache2/conf/.htpasswd_basic
COPY ./conf/.htpasswd_digest /usr/local/apache2/conf/.htpasswd_digest

ENTRYPOINT [ "bash" ]
