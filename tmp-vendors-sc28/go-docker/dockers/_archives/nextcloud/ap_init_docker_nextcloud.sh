#!/usr/bin/env bash

# Get docker password via below file in docker container
# https://github.com/nextcloud/all-in-one/discussions/803
# sudo cat /var/lib/docker/volumes/nextcloud_aio_mastercontainer/_data/data/configuration.json | grep password

mkdir -p "${AP_DOCKERS_DATA_DIR}/sc28/nextcloud/nextcloud-aio-mastercontainer"

alias dkrunnextcloud="docker run \
	--sig-proxy=false \
	--name nextcloud-aio-mastercontainer \
	--restart always \
	--publish 80:80 \
	--publish 8080:8080 \
	--publish 8443:8443 \
	--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
	--volume /var/run/docker.sock:/var/run/docker.sock:ro \
	nextcloud/all-in-one:latest"

alias dkexecnextcloud="docker exec -it nextcloud-aio-mastercontainer bash"
alias dkrmnextcloud="docker rm -f nextcloud-aio-mastercontainer"
alias dkcubnextcloud="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_nextcloud.yml up --build"
alias dkcubdnextcloud="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_nextcloud.yml up --build -d"
