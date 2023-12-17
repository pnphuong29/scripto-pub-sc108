# Default character encoding used by clients. (The clients can override this individually.) This value can also be set in the configuration file.
# export PGCLIENTENCODING=

# Default data directory location
# export PGDATA="${AP_DB_DIR}/postgres/data"

# Default port number (preferably set in the configuration file)
# export PGPORT=

# Logs
export AP_PG_LOCAL_LOG_FILE="${AP_LOGS_DIR}/pgsql/ap_pg_local.log"
[[ ! -d "${AP_LOGS_DIR}/pgsql" ]] && mkdir -p "${AP_LOGS_DIR}/pgsql"
alias showloglocalpg='cat "${AP_PG_LOCAL_LOG_FILE}"'

# Local postgres db
export AP_PG_LOCAL_PORT='5432'
export AP_PG_LOCAL_DB_NAME='postgres'
export AP_PG_LOCAL_USER='postgres'
export AP_PG_LOCAL_PASS=''

# Connect to local postgres db
alias pgclilocal='pgcli "postgres://${AP_PG_LOCAL_USER}:${AP_PG_LOCAL_PASS}@localhost/${AP_PG_LOCAL_DB_NAME}"'

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    export AP_PG_LOCAL_DATA_DIR="${AP_DB_DIR}/postgres/data"
    @addpath "/opt/homebrew/opt/postgresql@15/bin"

    # Create default cluster
    alias pginit='initdb -D "${AP_PG_LOCAL_DATA_DIR}" -U "${AP_PG_LOCAL_USER}"'

    # Remove default cluster
    alias pgremove='rm -rf "${AP_PG_LOCAL_DATA_DIR}"'

    alias pgstart='pg_ctl -D "${AP_PG_LOCAL_DATA_DIR}" -l "${AP_PG_LOCAL_LOG_FILE}" start'
    alias pgstop='pg_ctl -D "${AP_PG_LOCAL_DATA_DIR}" -l "${AP_PG_LOCAL_LOG_FILE}" stop'
    alias pgrestart='pg_ctl -D "${AP_PG_LOCAL_DATA_DIR}" -l "${AP_PG_LOCAL_LOG_FILE}" restart'
    alias pgstatus='pg_ctl -D "${AP_PG_LOCAL_DATA_DIR}" -l "${AP_PG_LOCAL_LOG_FILE}" status'
fi
