alias dkexecoasis="docker exec -it oasis bash"
alias dkrmoasis="docker rm -f oasis"
alias dkcuboasis="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_oasis.yml up --build"
alias dkcubdoasis="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_oasis.yml up --build -d"
