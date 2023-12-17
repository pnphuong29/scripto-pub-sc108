# https://sqlite.org/download.html

export AP_VENDORS_SQLITE_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/sqlite"
export AP_VENDORS_SQLITE_SETUP_CONFIGS_DIR="${AP_VENDORS_SQLITE_SETUP_DIR}/configs"

alias viscsqlite="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/sqlite/ap_init_sqlite.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/sqlite/ap_setup_sqlite.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/sqlite/ap_remove_sqlite.sh \
	"
