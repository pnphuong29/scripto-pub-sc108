export AP_DK_WP_MYSQL_NAME='wp'
export AP_DK_WP_MYSQL_USER='wp'

alias mycliwp="myclif \${AP_DOMAIN_DDNS1} \${AP_PORT_WP_MYSQL_PUBLIC} \${AP_DK_WP_MYSQL_USER} \$(cat \${AP_SECRET_WP_MYSQL_ROOT_PASS_FILE})"
alias mycliwplocal="myclif localhost \${AP_PORT_WP_MYSQL_PUBLIC} \${AP_DK_WP_MYSQL_USER} \$(cat \${AP_SECRET_WP_MYSQL_ROOT_PASS_FILE})"

alias truncatewpdbdata="sudo rm -rf \${AP_WP_DB_DIR}/mysql"

alias bkwpdb="docker exec ${AP_DK_CON_WP_MYSQL} mysqldump -uroot -p${AP_SECRET_WP_MYSQL_ROOT_PASS} ${AP_DK_WP_MYSQL_NAME} > ${AP_SERVER_WP_BK_DIR}/db/wp_$(gdate +"%Y%m%d_%H%M%S").sql"
alias bkwpdata="cp -R -L --preserve=all ${AP_SERVER_WP_DATA_DIR} ${AP_SERVER_WP_BK_DIR}/data/wp_data_$(gdate +"%Y%m%d_%H%M%S")"
