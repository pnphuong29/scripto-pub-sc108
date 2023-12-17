# https://hub.docker.com/r/filebrowser/filebrowser
# https://docs.docker.com/engine/reference/builder/

# At this time 27-May-2023, only s6 version worked! latest version didnot work!
ARG VERSION
FROM filebrowser/filebrowser:${VERSION}

# User `albert` will be required to WRITE to shared `data` which has the same user `albert` with host machine
RUN useradd -m albert
# RUN chsh -s /bin/bash albert

RUN mkdir -p /db
RUN chown albert.albert /db
RUN mkdir -p /logs
RUN chown albert.albert /logs

WORKDIR /db

# Use this trick to make sure UID and GID of running process is the same with host machine
# In order to WRITE with proper user/group permission for each file/folder
USER albert:1000

ENTRYPOINT [ "bash" ]
