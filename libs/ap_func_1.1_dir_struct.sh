alias apcreatedirstructcore="ap_func_create_dir_struct_core"
ap_func_create_dir_struct_core() {
    aplogshow "Create [core] directories, files and symlinks\n"

    # Logs
    aplogshow "Create directories [${AP_LOGS_DIR}/general] and log files\n"
    mkdir -p "${AP_LOGS_DIR}/crontabs"
    [ ! -f "${AP_LOGS_DIR}/crontabs/ap_crontab_test.log" ] && touch "${AP_LOGS_DIR}/crontabs/ap_crontab_test.log"

    mkdir -p "${AP_LOGS_DIR}/general"
    [ ! -f "${AP_LOGS_DIR}/general/ap_general.log" ] && touch "${AP_LOGS_DIR}/general/ap_general.log"
    [ ! -f "${AP_LOGS_DIR}/general/ap_error.log" ] && touch "${AP_LOGS_DIR}/general/ap_error.log"
    [ ! -f "${AP_LOGS_DIR}/general/ap_debug.log" ] && touch "${AP_LOGS_DIR}/general/ap_debug.log"

    # Test scripts
    if [ ! -d "${HOME}/scripto-share/tests" ]; then
        mkdir -p "${HOME}/scripto-share/tests"
    fi

    if [ ! -d "${HOME}/scripto-common/tests" ]; then
        mkdir -p "${HOME}/scripto-common/tests"
    fi

    if [ ! -d "${HOME}/scripto-main/tests" ]; then
        mkdir -p "${HOME}/scripto-main/tests"
    fi

    # Symlinks
    aplogshow "Create directories [${AP_SYMLINKS_DIR}]\n"
    mkdir -p "${AP_SYMLINKS_DIR}"

    # Configs
    aplogshow "Create directories [${AP_CONFIGS_DIR}]\n"
    mkdir -p "${AP_CONFIGS_DIR}"

    # Create ${AP_CONF_DEVICE_NAME_FILE} file if not existed
    if [ ! -f "${AP_CONF_DEVICE_NAME_FILE}" ]; then
        ap_device_id="$(showdeviceid)"
        if [ -n "${ap_device_id}" ]; then
            ap_device_name="$(json5 ~/scripto-common/devices.json | jq -r --arg device_id "${ap_device_id}" '.[] | select(.id == $device_id) | ."device-name"')"
            printf "%s" "${ap_device_name}" >"${AP_CONF_DEVICE_NAME_FILE}"
        fi
    fi

    # Create ${AP_CONF_GENERATE_CACHE_FILES} file if not existed
    if [ ! -f "${AP_CONF_GENERATE_CACHE_FILES}" ]; then
        printf "%s" "1" >"${AP_CONF_GENERATE_CACHE_FILES}"
    fi

    # Sofware
    aplogshow "Create directories [${AP_SOFT_DIR}/bin]\n"
    mkdir -p "${AP_SOFT_DIR}/bin"

    # Man pages
    aplogshow "Create directories [${AP_MAN_DIR}/man{1..8}]\n"
    mkdir -p "${AP_MAN_DIR}/man"{1..8}

    # Autocomplete
    aplogshow "Create directories [${AP_COMPLETIONS_DIR}]\n"
    mkdir -p "${AP_COMPLETIONS_DIR}"

    # Projects
    aplogshow "Create directories [${AP_PRJ_DIR}]\n"
    mkdir -p "${AP_PRJ_DIR}"

    # Tmp
    aplogshow "Create directories [${AP_TMP_DIR}]\n"
    mkdir -p "${AP_TMP_DIR}"
}

# alias apcreatedirstructglobal="ap_func_create_dir_struct_global"
# ap_func_create_dir_struct_global() {
#     if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
#         aplogshow "Create directories [/scripto-data]\n"
#         sudo mkdir -p /scripto-data
#         sudo chown -R "${USER}:${USER}" "/scripto-data"

#         aplogshow "Create directories [/scripto-share]\n"
#         sudo mkdir -p /scripto-share
#         sudo chown -R "${USER}:${USER}" "/scripto-share"

#         aplogshow "Create directories [/scripto-data/symlinks]\n"
#         mkdir -p /scripto-data/symlinks

#         aplogshow "Create directories [/scripto-data/softwares]\n"
#         mkdir -p /scripto-data/softwares

#         aplogshow "Create directories [/scripto-data/configs]\n"
#         mkdir -p /scripto-data/configs

#         aplogshow "Create directories [/scripto-data/logs]\n"
#         mkdir -p /scripto-data/logs
#     fi
# }
