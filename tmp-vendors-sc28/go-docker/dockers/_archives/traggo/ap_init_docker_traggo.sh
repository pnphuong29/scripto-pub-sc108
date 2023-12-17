export AP_TRAGGO_DATA_DIR="${AP_SERVER_DATA1_DIR}/traggo"
[[ -f "${AP_SECRETS_DIR}/ap_traggo_user_admin.passwd" ]] && export AP_TRAGGO_USER_ADMIN_PASSWD="$(cat "${AP_SECRETS_DIR}/ap_traggo_user_admin.passwd")"

alias dkexectraggo="docker exec -it traggo bash"
alias dkrmtraggo="docker rm -f traggo"
alias dkcubtraggo="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_traggo.yml up --build"
alias dkcubdtraggo="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_traggo.yml up --build -d"
