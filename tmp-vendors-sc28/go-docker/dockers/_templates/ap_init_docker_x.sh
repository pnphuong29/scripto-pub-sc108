export AP_DK_CON_NAME_XXX="xxx"
export AP_DK_CON_NAME_XXX_APP="xxx-app"
export AP_DK_CON_NAME_XXX_DB="xxx-db"

alias @mycli="myclif localhost \${AP_PORT_MYSQL} root \$(cat \${AP_SECRET_MYSQL_ROOT_PASS_FILE})"

alias truncatexxxdbdata="sudo rm -rf \${AP_XXX_DIR}/db"

alias vidkxxx="vi -p\
	${AP_DOCKERS_DIR}/ap_docker_compose_${AP_DK_CON_NAME_XXX}.yml \
	${AP_DOCKERS_DIR}/${AP_DK_CON_NAME_XXX}/ap_init_docker_${AP_DK_CON_NAME_XXX}.sh \
	${AP_DOCKERS_DIR}/${AP_DK_CON_NAME_XXX}/conf/extra/http-vhost.conf \
	${AP_DOCKERS_DIR}/${AP_DK_CON_NAME_XXX}/Dockerfile \
	${AP_DOCKERS_DIR}/${AP_DK_CON_NAME_XXX}/ap_entrypoint.sh"

alias bkxxxdb="docker exec ${AP_DK_CON_NAME_XXX_DB} pg_dump -U albert -d xxx -f /var/lib/postgresql/backups/xxx_$(gdate +"%Y%m%d_%H%M%S").sql"

alias dkexecxxx="docker exec -it ${AP_DK_CON_NAME_XXX} bash"
alias dkexecxxxapp="docker exec -it ${AP_DK_CON_NAME_XXX_APP} bash"
alias dkexecxxxdb="docker exec -it ${AP_DK_CON_NAME_XXX_DB} bash"

alias dkrmxxx="docker rm -f ${AP_DK_CON_NAME_XXX}"
alias dkrmxxxapp="docker rm -f ${AP_DK_CON_NAME_XXX_APP}"
alias dkrmxxxdb="docker rm -f ${AP_DK_CON_NAME_XXX_DB}"

alias upxxx="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_${AP_DK_CON_NAME_XXX}.yml up --build -d"
alias upxxxdb="cd ${AP_DOCKERS_DIR}; docker compose -f ap_docker_compose_common.yml -f ap_docker_compose_${AP_DK_CON_NAME_XXX}.yml up --build -d ${AP_DK_CON_NAME_XXX_DB}"
