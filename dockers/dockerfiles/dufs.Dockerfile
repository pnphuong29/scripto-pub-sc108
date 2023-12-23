# https://hub.docker.com/_/ubuntu
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM ubuntu:${VERSION}

RUN useradd -M albert
USER albert:albert

ENTRYPOINT [ "/bin/bash" ]
