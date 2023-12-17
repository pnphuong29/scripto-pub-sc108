alias @createdirstructcore="ap_func_create_dir_struct_core"
ap_func_create_dir_struct_core() {
    @logshow "Create [core] directories, files and symlinks\n"

    # Symlinks
    @logshow "Create directory [${AP_SYMLINKS_DIR}]\n"
    mkdir -p "${AP_SYMLINKS_DIR}"

    # Sofware
    @logshow "Create directory [${AP_SOFT_DIR}]\n"
    mkdir -p "${AP_SOFT_DIR}"

    # Configs
    @logshow "Create directory [${AP_CONFIGS_DIR}]\n"
    mkdir -p "${AP_CONFIGS_DIR}"

    # Man pages
    @logshow "Create directory [${AP_MAN_DIR}]\n"
    mkdir -p "${AP_MAN_DIR}"

    # Autocomplete
    @logshow "Create directory [${AP_COMPLETIONS_DIR}]\n"
    mkdir -p "${AP_COMPLETIONS_DIR}"

    # Tmp
    @logshow "Create directory [${AP_TMP_DIR}]\n"
    mkdir -p "${AP_TMP_DIR}"

    # Logs
    @logshow "Create directory [${AP_LOGS_DIR}/general] and log files\n"
    mkdir -p "${AP_LOGS_DIR}/general"
    [ ! -f "${AP_LOGS_DIR}/general/ap_general.log" ] && touch "${AP_LOGS_DIR}/general/ap_general.log"
    [ ! -f "${AP_LOGS_DIR}/general/ap_error.log" ] && touch "${AP_LOGS_DIR}/general/ap_error.log"
    [ ! -f "${AP_LOGS_DIR}/general/ap_debug.log" ] && touch "${AP_LOGS_DIR}/general/ap_debug.log"
}
