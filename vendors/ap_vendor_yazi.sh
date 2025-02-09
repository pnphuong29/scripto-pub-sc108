alias apinityazi="ap_func_init_yazi"
ap_func_init_yazi() {
    # apaddpath "${AP_SOFT_DIR}/yazi"

    if alias apinityazishare &>/dev/null; then
        apinityazishare
    fi

    if alias apinityazicommon &>/dev/null; then
        apinityazicommon
    fi

    if alias apinityazimain &>/dev/null; then
        apinityazimain
    fi
}

alias apcreatedirstructyazi="ap_func_create_dirstruct_yazi"
ap_func_create_dirstruct_yazi() {
    apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/yazi] to [${AP_SOFT_DIR}/yazi/ya]\n"
    ln -sf "${AP_SOFT_DIR}/yazi/yazi" "${AP_SOFT_DIR}/bin/yazi"

    apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/yazi] to [${AP_SOFT_DIR}/yazi/ya]\n"
    ln -sf "${AP_SOFT_DIR}/yazi/ya" "${AP_SOFT_DIR}/bin/ya"

    if alias apcreatedirstructyazishare &>/dev/null; then
        apcreatedirstructyazishare
    fi

    if alias apcreatedirstructyazicommon &>/dev/null; then
        apcreatedirstructyazicommon
    fi

    if alias apcreatedirstructyazimain &>/dev/null; then
        apcreatedirstructyazimain
    fi
}

alias aprmdirstructyazi="ap_func_rm_dirstruct_yazi"
ap_func_rm_dirstruct_yazi() {
    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/yazi]\n"
    rm -f "${AP_SOFT_DIR}/bin/yazi"

    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/ya]\n"
    rm -f "${AP_SOFT_DIR}/bin/ya"

    if alias aprmdirstructyazishare &>/dev/null; then
        aprmdirstructyazishare
    fi

    if alias aprmdirstructyazicommon &>/dev/null; then
        aprmdirstructyazicommon
    fi

    if alias aprmdirstructyazimain &>/dev/null; then
        aprmdirstructyazimain
    fi
}

alias apcreateglobalsymlinkyazi="ap_func_create_global_symlink_yazi"
ap_func_create_global_symlink_yazi() {
    if [ -f "${AP_SOFT_DIR}/bin/yazi" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/yazi] to [${AP_SOFT_DIR}/bin/yazi]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/yazi" "/usr/local/bin/yazi"
    fi
}

alias aprmglobalsymlinkyazi="ap_func_rm_global_symlink_yazi"
ap_func_rm_global_symlink_yazi() {
    if [ -f "/usr/local/bin/yazi" ]; then
        apshowmsginfo "Remove [/usr/local/bin/yazi]\n"
        sudo rm -f "/usr/local/bin/yazi"
    fi
}

alias apsetupyazi="ap_func_setup_yazi"
ap_func_setup_yazi() {
    apshowmsginfo "Install [yazi]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/yazi"
    rm -rf "${AP_TMP_DIR}/yazi"

    # Install yazi
    mkdir -p "${AP_TMP_DIR}/yazi"
    cd "${AP_TMP_DIR}/yazi"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/sxyazi/yazi/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep "aarch64")" >yazi.zip
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/sxyazi/yazi/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep "x86_64")" >yazi.zip
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/sxyazi/yazi/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep gnu)" >yazi.zip
    fi

    unzip yazi.zip
    rm -f yazi.zip

    mv yazi* yazi
    mv yazi "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/yazi"
    rm -rf "${AP_TMP_DIR}/yazi"

    apinityazi
    apcreateglobalsymlinkyazi

    if alias apcreatedirstructyazi &>/dev/null; then
        apcreatedirstructyazi
    fi
}

alias aprmyazi="ap_func_rm_yazi"
ap_func_rm_yazi() {
    apshowmsginfo "Remove [yazi]\n"

    rm -rf "${AP_SOFT_DIR}/yazi"

    if alias aprmdirstructyazi &>/dev/null; then
        aprmdirstructyazi
    fi

    if alias aprmglobalsymlinkyazi &>/dev/null; then
        aprmglobalsymlinkyazi
    fi
}
