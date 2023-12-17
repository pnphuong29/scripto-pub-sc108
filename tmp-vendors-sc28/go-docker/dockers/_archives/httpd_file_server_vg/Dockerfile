# https://hub.docker.com/_/httpd
# https://docs.docker.com/engine/reference/builder/

FROM httpd:2.4.53

COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./conf/extra/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

ENTRYPOINT [ "bash" ]
