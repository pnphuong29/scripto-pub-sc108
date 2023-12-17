# https://hub.docker.com/r/dpage/pgadmin4/
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM dpage/pgadmin4:${VERSION}

ENTRYPOINT [ "/entrypoint.sh" ]
