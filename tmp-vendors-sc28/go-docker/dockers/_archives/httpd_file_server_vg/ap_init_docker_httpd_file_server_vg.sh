#!/usr/bin/env bash

mkdir -p "${AP_DOCKERS_DATA_DIR}/sc28/httpd-file-server-vg/logs"

alias dkexechttpd-file-server-vg="docker exec -it sc28-httpd-file-server-vg bash"
alias dkrmhttpd-file-server-vg="docker rm -f sc28-httpd-file-server-vg"
alias dkcubhttpd-file-server-vg="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_httpd_file_server_vg.yml up --build"
alias dkcubdhttpd-file-server-vg="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_httpd_file_server_vg.yml up --build -d"
