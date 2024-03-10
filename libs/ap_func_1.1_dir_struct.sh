alias apcreatedirstructcore="ap_func_create_dir_struct_core"
ap_func_create_dir_struct_core() {
    aplogshow "Create [core] directories, files and symlinks\n"

    # Logs
    aplogshow "Create directories [${AP_LOGS_DIR}/general] and log files\n"
    mkdir -p "${AP_LOGS_DIR}/general"
    [ ! -f "${AP_LOGS_DIR}/general/ap_general.log" ] && touch "${AP_LOGS_DIR}/general/ap_general.log"
    [ ! -f "${AP_LOGS_DIR}/general/ap_error.log" ] && touch "${AP_LOGS_DIR}/general/ap_error.log"
    [ ! -f "${AP_LOGS_DIR}/general/ap_debug.log" ] && touch "${AP_LOGS_DIR}/general/ap_debug.log"

    # Symlinks
    aplogshow "Create directories [${AP_SYMLINKS_DIR}]\n"
    mkdir -p "${AP_SYMLINKS_DIR}"

    # Sofware
    aplogshow "Create directories [${AP_SOFT_DIR}/bin]\n"
    mkdir -p "${AP_SOFT_DIR}/bin"

    # Configs
    aplogshow "Create directories [${AP_CONFIGS_DIR}]\n"
    mkdir -p "${AP_CONFIGS_DIR}"

    # Man pages
    aplogshow "Create directories [${AP_MAN_DIR}/man{1..8}]\n"
    mkdir -p "${AP_MAN_DIR}/man"{1..8}

    # Autocomplete
    aplogshow "Create directories [${AP_COMPLETIONS_DIR}]\n"
    mkdir -p "${AP_COMPLETIONS_DIR}"

    # VMS
    aplogshow "Create directories [${AP_VMS_DIR}]\n"
    mkdir -p "${AP_VMS_DIR}"

    # Projects
    aplogshow "Create directories [${AP_PRJ_DIR}]\n"
    mkdir -p "${AP_PRJ_DIR}"

    # Tmp
    aplogshow "Create directories [${AP_TMP_DIR}]\n"
    mkdir -p "${AP_TMP_DIR}"
}
