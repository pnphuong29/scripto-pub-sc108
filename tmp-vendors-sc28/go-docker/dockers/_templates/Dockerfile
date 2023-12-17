# https://hub.docker.com/_/httpd
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM xxx:${VERSION}

# User `albert` will be required to WRITE to shared `/var/www/webdav` dir which has the same user `albert` with host machine
RUN useradd -m albert

COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf

ENTRYPOINT [ "bash" ]
