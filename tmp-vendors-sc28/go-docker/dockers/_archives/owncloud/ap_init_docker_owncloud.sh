mkdir -p "${AP_DOCKERS_DATA_DIR}/sc28/owncloud/"

alias dkexecowncloud="docker exec -it owncloud_server bash"
alias dkrmowncloud="docker rm -f owncloud_server"
alias dkcubowncloud="cd ${AP_DOCKERS_DIR}; docker compose --env-file "${AP_DOCKERS_DIR}/owncloud/.env" -f ap_docker_compose_owncloud.yml up --build"
alias dkcubdowncloud="cd ${AP_DOCKERS_DIR}; docker compose --env-file "${AP_DOCKERS_DIR}/owncloud/.env" -f ap_docker_compose_owncloud.yml up --build -d"
