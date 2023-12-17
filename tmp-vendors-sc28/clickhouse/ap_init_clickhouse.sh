alias ch="clickhouse"
alias chstart='cd "${AP_DB_DIR}/clickhouse"; clickhouse server --config-file=etc/clickhouse-server/config.xml --pidfile=pid'
alias chkill='kill -KILL "$( cat "${AP_DB_DIR}/clickhouse/pid" )"'
alias chcli='clickhouse-cli'
