alias apinitlnav="ap_func_init_lnav"
ap_func_init_lnav() {
    if alias apinitlnavshare &>/dev/null; then
        apinitlnavshare
    fi

    if alias apinitlnavcommon &>/dev/null; then
        apinitlnavcommon
    fi

    if alias apinitlnavmain &>/dev/null; then
        apinitlnavmain
    fi
}

alias apcreatedirstructlnav="ap_func_create_dirstruct_lnav"
ap_func_create_dirstruct_lnav() {
    if [ -f "${AP_SOFT_DIR}/lnav/lnav" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/lnav] to [${AP_SOFT_DIR}/lnav/lnav]\n"
        ln -sf "${AP_SOFT_DIR}/lnav/lnav" "${AP_SOFT_DIR}/bin/lnav"
    fi

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/lnav.1] to [${AP_SOFT_DIR}/lnav/lnav.1]\n"
    ln -sf "${AP_SOFT_DIR}/lnav/lnav.1" "${AP_MAN_DIR}/man1/lnav.1"

    if alias apcreatedirstructlnavshare &>/dev/null; then
        apcreatedirstructlnavshare
    fi

    if alias apcreatedirstructlnavcommon &>/dev/null; then
        apcreatedirstructlnavcommon
    fi

    if alias apcreatedirstructlnavmain &>/dev/null; then
        apcreatedirstructlnavmain
    fi
}

alias aprmdirstructlnav="ap_func_rm_dirstruct_lnav"
ap_func_rm_dirstruct_lnav() {
    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/lnav]\n"
    rm -f "${AP_SOFT_DIR}/bin/lnav"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/lnav.1]\n"
    rm -f "${AP_MAN_DIR}/man1/lnav.1"

    if alias aprmdirstructlnavshare &>/dev/null; then
        aprmdirstructlnavshare
    fi

    if alias aprmdirstructlnavcommon &>/dev/null; then
        aprmdirstructlnavcommon
    fi

    if alias aprmdirstructlnavmain &>/dev/null; then
        aprmdirstructlnavmain
    fi
}

alias apcreateglobalsymlinklnav="ap_func_create_global_symlink_lnav"
ap_func_create_global_symlink_lnav() {
    if [ -f "${AP_SOFT_DIR}/bin/lnav" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/lnav] to [${AP_SOFT_DIR}/bin/lnav]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/lnav" "/usr/local/bin/lnav"
    fi
}

alias aprmglobalsymlinklnav="ap_func_rm_global_symlink_lnav"
ap_func_rm_global_symlink_lnav() {
    if [ -f "/usr/local/bin/lnav" ]; then
        apshowmsginfo "Remove [/usr/local/bin/lnav]\n"
        sudo rm -f "/usr/local/bin/lnav"
    fi
}

alias apsetuplnav="ap_func_setup_lnav"
ap_func_setup_lnav() {
    apshowmsginfo "Install [lnav]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/lnav"
    rm -rf "${AP_TMP_DIR}/lnav"

    # Install lnav
    mkdir -p "${AP_TMP_DIR}/lnav"
    cd "${AP_TMP_DIR}/lnav"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew install lnav
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/tstack/lnav/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep aarch64)" >lnav.zip
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/tstack/lnav/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64)" >lnav.zip
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/tstack/lnav/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64)" >lnav.zip
    fi

    unzip lnav.zip
    mv lnav-* lnav
    mv lnav "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/lnav"
    # rm -rf "${AP_TMP_DIR}/lnav"

    apinitlnav

    if alias apcreatedirstructlnav &>/dev/null; then
        apcreatedirstructlnav
    fi

    apcreateglobalsymlinklnav
}

alias aprmlnav="ap_func_rm_lnav"
ap_func_rm_lnav() {
    apshowmsginfo "Remove [lnav]\n"
    rm -rf "${AP_SOFT_DIR}/lnav"

    if alias aprmdirstructlnav &>/dev/null; then
        aprmdirstructlnav
    fi

    if alias aprmglobalsymlinklnav &>/dev/null; then
        aprmglobalsymlinklnav
    fi
}
