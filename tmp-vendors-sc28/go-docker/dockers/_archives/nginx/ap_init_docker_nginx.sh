alias dkexecnginx="docker exec -it nginx bash"
alias dkrmnginx="docker rm -f nginx"
alias dkcubnginx="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_nginx.yml up --build"
alias dkcubdnginx="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_nginx.yml up --build -d"
