# https://hub.docker.com/_/httpd
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM httpd:${VERSION}

ARG AP_DK_CON_TMP
COPY ./configs/apache-httpd/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./configs/apache-httpd/extra/httpd-vhosts-${AP_DK_CON_TMP}.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

ENTRYPOINT [ "bash" ]
