alias @myclilocal="myclif localhost \${AP_PORT_MYSQL_PUBLIC} root \$(cat \${AP_SECRET_MYSQL_ROOT_PASS_FILE})"
alias @mycli="myclif \${AP_DOMAIN_DDNS1} \${AP_PORT_MYSQL_PUBLIC} root \$(cat \${AP_SECRET_MYSQL_ROOT_PASS_FILE})"
alias truncatemysqldata="sudo rm -rf ${AP_SERVER_MYSQL_DB_DIR}"/*
alias bkmysql="docker exec ${AP_DK_CON_MYSQL} mysqldump -uroot -p${AP_SECRET_MYSQL_ROOT_PASS} --all-databases > ${AP_SERVER_MYSQL_BK_DIR}/db/mysql_$(gdate +"%Y%m%d_%H%M%S").sql"
