export AP_DK_WOO_MYSQL_NAME='woo'
export AP_DK_WOO_MYSQL_USER='woo'

alias mycliwoo="myclif \${AP_DOMAIN_DDNS1} \${AP_PORT_WOO_MYSQL_PUBLIC} \${AP_DK_WOO_MYSQL_USER} \$(cat \${AP_SECRET_WOO_MYSQL_ROOT_PASS_FILE})"
alias mycliwoolocal="myclif localhost \${AP_PORT_WOO_MYSQL_PUBLIC} \${AP_DK_WOO_MYSQL_USER} \$(cat \${AP_SECRET_WOO_MYSQL_ROOT_PASS_FILE})"

alias truncatewoodbdata="sudo rm -rf \${AP_WOO_DB_DIR}/mysql"

alias bkwoodb="docker exec ${AP_DK_CON_WOO_MYSQL} mysqldump -uroot -p${AP_SECRET_WOO_MYSQL_ROOT_PASS} ${AP_DK_WOO_MYSQL_NAME} > ${AP_SERVER_WOO_BK_DIR}/db/woo_$(gdate +"%Y%m%d_%H%M%S").sql"
alias bkwoodata="cp -R -L --preserve=all ${AP_SERVER_WOO_DATA_DIR} ${AP_SERVER_WOO_BK_DIR}/data/woo_data_$(gdate +"%Y%m%d_%H%M%S")"
