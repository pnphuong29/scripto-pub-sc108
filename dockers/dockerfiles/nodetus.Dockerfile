# https://hub.docker.com/_/node
# https://docs.docker.com/engine/reference/builder/

ARG VERSION
FROM node:${VERSION}

COPY ./dockers/volumes/nodetus/package.json /nodetus/package.json
COPY ./dockers/volumes/nodetus/package-lock.json /nodetus/package-lock.json
WORKDIR /nodetus
RUN npm install

ENTRYPOINT [ "bash" ]
