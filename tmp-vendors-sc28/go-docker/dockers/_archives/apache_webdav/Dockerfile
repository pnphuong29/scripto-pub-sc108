# https://hub.docker.com/_/httpd
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM httpd:${VERSION}

# User `albert` which should have UID:GID = 1000:1000 will be required to WRITE to shared `/var/www/webdav` dir which has the same user `albert` with host machine
RUN useradd -m albert

COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./conf/extra/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
COPY ./conf/.htpasswd_basic /usr/local/apache2/conf/.htpasswd_basic
COPY ./conf/.htpasswd_digest /usr/local/apache2/conf/.htpasswd_digest

ENTRYPOINT [ "bash" ]
