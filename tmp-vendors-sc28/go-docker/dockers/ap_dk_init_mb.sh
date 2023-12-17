export AP_DK_MB_PG_NAME="metabase"
export AP_DK_MB_PG_USER="mb"

alias truncatembpgdata="sudo rm -rf ${AP_SERVER_MB_DB_DIR}/pg"/*
alias bkmbdb="docker exec ${AP_DK_CON_MB_PG} pg_dump -U ${AP_DK_MB_PG_USER} -d ${AP_DK_MB_PG_NAME} > ${AP_SERVER_MB_BK_DIR}/db/metabase_$(gdate +"%Y%m%d_%H%M%S").sql"
