export AP_PIWIGO_SERVER_LOGS_DIR="${AP_PIWIGO_SERVER_DIR}/logs"

export AP_DK_CON_NAME_PIWIGO='piwigo'
export AP_DK_CON_NAME_PIWIGO_DB='piwigo-db'

export AP_DK_PIWIGO_DB_ROOT_PASS="piwigo123456"
export AP_DK_PIWIGO_DB_USER="piwigo"
export AP_DK_PIWIGO_DB_PASS="piwigo"
export AP_DK_PIWIGO_DB_NAME="piwigo"

alias dkexecpiwigo="docker exec -it ${AP_DK_CON_NAME_PIWIGO} bash"
alias dkexecpiwigodb="docker exec -it ${AP_DK_CON_NAME_PIWIGO} bash"
alias dkrmpiwigo="docker rm -f ${AP_DK_CON_NAME_PIWIGO_DB} ${AP_DK_CON_NAME_PIWIGO}"
alias dkrmpiwigoapp="docker rm -f ${AP_DK_CON_NAME_PIWIGO}"
alias dkrmpiwigodb="docker rm -f ${AP_DK_CON_NAME_PIWIGO_DB}"
alias dkcubdpiwigo="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_${AP_DK_CON_NAME_PIWIGO}.yml up --build -d"
