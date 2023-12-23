# quay.io/hedgedoc/hedgedoc
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM quay.io/hedgedoc/hedgedoc:${VERSION}

RUN apt update
# RUN apt install -y procps
RUN apt install -y sudo

# User `node` has UID=1000 will be required to WRITE to shared `uploads` dir which has the same user `albert` with host machine
# Need to grant `node` user sudo permission and NOPASSWD when execute command `chown`
RUN echo "node ALL=(ALL) NOPASSWD: /bin/chown" > /etc/sudoers.d/node

# Use this trick to make sure UID and GID of running process is the same with host machine
# In order to WRITE with proper user/group permission for each file/folder
USER 1000:1000

ENTRYPOINT [ "bash" ]
