export AP_DK_JL_PG_NAME="joplin"
export AP_DK_JL_PG_USER="postgres"

alias pgclijl="pgclif \${AP_DOMAIN_DDNS1} \${AP_PORT_JL_PG_PUBLIC} \${AP_DK_JL_PG_USER} \$(cat \${AP_SECRET_JL_PG_PASS_FILE})"

alias bkjlpg="docker exec ${AP_DK_CON_JL_PG} pg_dump -U ${AP_DK_JL_PG_USER} -d ${AP_DK_JL_PG_NAME} > ${AP_SERVER_JL_BK_DIR}/db/jl_pg_$(gdate +"%Y%m%d_%H%M%S").sql"
alias bkjldata="cp -R -L --preserve=all ${HOME}/.config/joplin-desktop/ ${AP_SERVER_JL_BK_DIR}/data/jl_data_$(gdate +"%Y%m%d_%H%M%S")"
