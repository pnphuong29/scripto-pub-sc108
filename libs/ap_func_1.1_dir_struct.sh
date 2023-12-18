alias @createdirstructcore="ap_func_create_dir_struct_core"
ap_func_create_dir_struct_core() {
    @logshow "Create [core] directories, files and symlinks\n"

    # Symlinks
    @logshow "Create directories [${AP_SYMLINKS_DIR}]\n"
    mkdir -p "${AP_SYMLINKS_DIR}"

    # Sofware
    @logshow "Create directories [${AP_SOFT_DIR}/bin]\n"
    mkdir -p "${AP_SOFT_DIR}/bin"

    # Configs
    @logshow "Create directories [${AP_CONFIGS_DIR}]\n"
    mkdir -p "${AP_CONFIGS_DIR}"

    # Man pages
    @logshow "Create directories [${AP_MAN_DIR}/man{1..8}]\n"
    mkdir -p "${AP_MAN_DIR}/man"{1..8}

    # Autocomplete
    @logshow "Create directories [${AP_COMPLETIONS_DIR}]\n"
    mkdir -p "${AP_COMPLETIONS_DIR}"

    # Tmp
    @logshow "Create directories [${AP_TMP_DIR}]\n"
    mkdir -p "${AP_TMP_DIR}"

    # Logs
    @logshow "Create directories [${AP_LOGS_DIR}/general] and log files\n"
    mkdir -p "${AP_LOGS_DIR}/general"
    [ ! -f "${AP_LOGS_DIR}/general/ap_general.log" ] && touch "${AP_LOGS_DIR}/general/ap_general.log"
    [ ! -f "${AP_LOGS_DIR}/general/ap_error.log" ] && touch "${AP_LOGS_DIR}/general/ap_error.log"
    [ ! -f "${AP_LOGS_DIR}/general/ap_debug.log" ] && touch "${AP_LOGS_DIR}/general/ap_debug.log"
}
