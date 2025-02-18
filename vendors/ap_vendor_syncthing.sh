alias apinitsyncthing="ap_func_init_syncthing"
ap_func_init_syncthing() {
    if alias apinitsyncthingshare &>/dev/null; then
        apinitsyncthingshare
    fi

    if alias apinitsyncthingcommon &>/dev/null; then
        apinitsyncthingcommon
    fi

    if alias apinitsyncthingmain &>/dev/null; then
        apinitsyncthingmain
    fi
}

alias apcreatedirstructsyncthing="ap_func_create_dirstruct_syncthing"
ap_func_create_dirstruct_syncthing() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/syncthing] to [${AP_SOFT_DIR}/syncthing/syncthing]\n"
    ln -sf "${AP_SOFT_DIR}/syncthing/syncthing" "${AP_SOFT_DIR}/bin/syncthing"

    aplogshow "Generate [syncthing] bash autocomplete\n"
    printf "%s" "$(syncthing install-completions) st" >"${AP_COMPLETIONS_DIR}/ap_completion_syncthing.bash" # Add alias `st` for `syncthing`

    if alias apcreatedirstructsyncthingshare &>/dev/null; then
        apcreatedirstructsyncthingshare
    fi

    if alias apcreatedirstructsyncthingcommon &>/dev/null; then
        apcreatedirstructsyncthingcommon
    fi

    if alias apcreatedirstructsyncthingmain &>/dev/null; then
        apcreatedirstructsyncthingmain
    fi
}

alias aprmdirstructsyncthing="ap_func_rm_dirstruct_syncthing"
ap_func_rm_dirstruct_syncthing() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/syncthing]\n"
    rm -f "${AP_SOFT_DIR}/bin/syncthing"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_syncthing.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_syncthing.bash"

    if alias aprmdirstructsyncthingshare &>/dev/null; then
        aprmdirstructsyncthingshare
    fi

    if alias aprmdirstructsyncthingcommon &>/dev/null; then
        aprmdirstructsyncthingcommon
    fi

    if alias aprmdirstructsyncthingmain &>/dev/null; then
        aprmdirstructsyncthingmain
    fi
}

alias apcreateglobalsymlinksyncthing="ap_func_create_global_symlink_syncthing"
ap_func_create_global_symlink_syncthing() {
    if [ -f "${AP_SOFT_DIR}/bin/syncthing" ]; then
        aplogshow "Create symlink from [/usr/local/bin/syncthing] to [${AP_SOFT_DIR}/bin/syncthing]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/syncthing" "/usr/local/bin/syncthing"
    fi
}

alias aprmglobalsymlinksyncthing="ap_func_rm_global_symlink_syncthing"
ap_func_rm_global_symlink_syncthing() {
    if [ -f "/usr/local/bin/syncthing" ]; then
        aplogshow "Remove [/usr/local/bin/syncthing]\n"
        sudo rm -f "/usr/local/bin/syncthing"
    fi
}

alias apsetupsyncthing="ap_func_setup_syncthing"
ap_func_setup_syncthing() {
    aplogshow "Install [syncthing]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/syncthing"
    rm -rf "${AP_TMP_DIR}/syncthing"

    # Install syncthing
    mkdir -p "${AP_TMP_DIR}/syncthing"
    cd "${AP_TMP_DIR}/syncthing"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/syncthing/syncthing/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep "arm64")" >syncthing.zip
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/syncthing/syncthing/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep "amd64")" >syncthing.zip
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/syncthing/syncthing/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep "amd64")" >syncthing.tar.gz
    fi

    tar -zxf syncthing.tar.gz
    mv syncthing-* syncthing
    mv syncthing "${AP_SOFT_DIR}/"

    apinitsyncthing
    apcreateglobalsymlinksyncthing

    if alias apcreatedirstructsyncthing &>/dev/null; then
        apcreatedirstructsyncthing
    fi
}

alias aprmsyncthing="ap_func_rm_syncthing"
ap_func_rm_syncthing() {
    aplogshow "Remove [syncthing]\n"

    rm -rf "${AP_SOFT_DIR}/syncthing"

    if alias aprmdirstructsyncthing &>/dev/null; then
        aprmdirstructsyncthing
    fi

    if alias aprmglobalsymlinksyncthing &>/dev/null; then
        aprmglobalsymlinksyncthing
    fi
}
