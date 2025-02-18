alias apinitbat="ap_func_init_bat"
ap_func_init_bat() {
    if alias apinitbatshare &>/dev/null; then
        apinitbatshare
    fi

    if alias apinitbatcommon &>/dev/null; then
        apinitbatcommon
    fi
}

alias apcreatedirstructbat="ap_func_create_dirstruct_bat"
ap_func_create_dirstruct_bat() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/bat] to [${AP_SOFT_DIR}/bat/bat]\n"
    ln -sf "${AP_SOFT_DIR}/bat/bat" "${AP_SOFT_DIR}/bin/bat"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_bat.bash] to [${AP_SOFT_DIR}/bat/complete/bat.bash]\n"
    ln -sf "${AP_SOFT_DIR}/bat/autocomplete/bat.bash" "${AP_COMPLETIONS_DIR}/ap_completion_bat.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/bat.1] to [${AP_SOFT_DIR}/bat/bat.1]\n"
    ln -sf "${AP_SOFT_DIR}/bat/bat.1" "${AP_MAN_DIR}/man1/bat.1"

    if alias apcreatedirstructbatshare &>/dev/null; then
        apcreatedirstructbatshare
    fi

    if alias apcreatedirstructbatcommon &>/dev/null; then
        apcreatedirstructbatcommon
    fi
}

alias aprmdirstructbat="ap_func_rm_dirstruct_bat"
ap_func_rm_dirstruct_bat() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/bat]\n"
    rm -f "${AP_SOFT_DIR}/bin/bat"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_bat.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_bat.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/bat.1]\n"
    rm -f "${AP_MAN_DIR}/man1/bat.1"

    if alias aprmdirstructbatshare &>/dev/null; then
        aprmdirstructbatshare
    fi

    if alias aprmdirstructbatcommon &>/dev/null; then
        aprmdirstructbatcommon
    fi
}

alias apcreateglobalsymlinkbat="ap_func_create_global_symlink_bat"
ap_func_create_global_symlink_bat() {
    if [ -f "${AP_SOFT_DIR}/bat/bat" ]; then
        aplogshow "Create symlink from [/usr/local/bin/bat] to [${AP_SOFT_DIR}/bat/bat]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bat/bat" "/usr/local/bin/bat"
    fi
}

alias aprmglobalsymlinkbat="ap_func_rm_global_symlink_bat"
ap_func_rm_global_symlink_bat() {
    if [ -f "/usr/local/bin/bat" ]; then
        aplogshow "Remove [/usr/local/bin/bat]\n"
        sudo rm -f "/usr/local/bin/bat"
    fi
}

alias apsetupbat="ap_func_setup_bat"
ap_func_setup_bat() {
    # https://github.com/sharkdp/bat
    aplogshow "Install [bat]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/bat"
    rm -rf "${AP_TMP_DIR}/bat"

    # Install bat
    mkdir -p "${AP_TMP_DIR}/bat"
    cd "${AP_TMP_DIR}/bat"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/sharkdp/bat/releases | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep x86_64 | grep -v sha256)" >bat.tar.gz
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/sharkdp/bat/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep "musl")" >bat.tar.gz
    fi

    tar -zxf bat.tar.gz
    rm -f bat.tar.gz
    mv bat* bat
    mv bat "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/bat"

    apinitbat

    if alias apcreatedirstructbat &>/dev/null; then
        apcreatedirstructbat
    fi
}

alias aprmbat="ap_func_rm_bat"
ap_func_rm_bat() {
    aplogshow "Remove [bat]\n"
    rm -rf "${AP_SOFT_DIR}/bat"

    if alias aprmdirstructbat &>/dev/null; then
        aprmdirstructbat
    fi

    if alias aprmglobalsymlinkbat &>/dev/null; then
        aprmglobalsymlinkbat
    fi
}
