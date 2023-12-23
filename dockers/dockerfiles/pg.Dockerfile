# https://hub.docker.com/_/postgres
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM postgres:${VERSION}
