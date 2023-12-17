export AP_DK_CON_NAME_HTTPD_SERVER="httpd_server"

alias dkexechttpdserver="docker exec -it ${AP_DK_CON_NAME_HTTPD_SERVER} bash"
alias dkrmhttpdserver="docker rm -f ${AP_DK_CON_NAME_HTTPD_SERVER}"
alias uphttpdserver="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_${AP_DK_CON_NAME_HTTPD_SERVER}.yml up --build -d"
