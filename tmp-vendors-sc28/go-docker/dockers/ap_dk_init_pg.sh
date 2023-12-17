export AP_DK_PG_USER="postgres"

alias pgclilocal="pgclif localhost \${AP_PORT_PG_PUBLIC} \${AP_DK_PG_USER} \$(cat \${AP_SECRET_PG_PASS_FILE})"
alias pgclipg="pgclif \${AP_DOMAIN_DDNS1} \${AP_PORT_PG_PUBLIC} \${AP_DK_PG_USER} \$(cat \${AP_SECRET_PG_PASS_FILE})"
alias truncatepgdata="sudo rm -rf ${AP_SERVER_PG_DB_DIR}; mkdir -p ${AP_SERVER_PG_DB_DIR}"
alias bkpg="docker exec ${AP_DK_CON_PG} pg_dumpall -U ${AP_DK_PG_USER} > ${AP_SERVER_PG_BK_DIR}/db/pg_$(gdate +"%Y%m%d_%H%M%S").sql"
