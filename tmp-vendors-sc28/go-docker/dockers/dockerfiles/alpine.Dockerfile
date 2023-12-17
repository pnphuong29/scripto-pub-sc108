# https://hub.docker.com/_/alpine
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM alpine:${VERSION}

# https://pet2cattle.com/2022/11/alpine-not-found
# https://stackoverflow.com/questions/66963068/docker-alpine-executable-binary-not-found-even-if-in-path
# To be able to use binaries built to use glibc with musl
# Use this to execute any binary files as below such as `dufs`
RUN apk add libc6-compat
# RUN apk add gcompat

RUN apk add --no-cache --upgrade bash
RUN adduser -H --disabled-password --gecos "" -s /bin/bash albert albert

# COPY ./bin/dufs /bin/dufs 

# RUN mkdir -p /data
# RUN chown albert.albert /data

# WORKDIR /data

USER albert:albert

ENTRYPOINT [ "/bin/bash" ]
