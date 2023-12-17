export AP_DK_CON_NAME_PHP_APACHE='php_apache'

alias dkexecphpapache="docker exec -it ${AP_DK_CON_NAME_PHP_APACHE} bash"
alias dkrmphpapache="docker rm -f ${AP_DK_CON_NAME_PHP_APACHE}"
alias upphpapache="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_${AP_DK_CON_NAME_PHP_APACHE}.yml up --build -d"
