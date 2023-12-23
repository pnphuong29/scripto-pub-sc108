# https://hub.docker.com/_/mysql
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM mysql:${VERSION}

COPY ./zzz.cnf /etc/mysql/mysql.conf.d/zzz.conf

ENTRYPOINT [ "bash" ]
