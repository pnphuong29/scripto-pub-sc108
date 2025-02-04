alias apinithexyl="ap_func_init_hexyl"
ap_func_init_hexyl() {
    export AP_XXX_CONF_DIR="${HOME}/.config/hexyl"

    alias zhexyl="cd /Applications/hexyl.app/Contents/MacOS"
    alias zhexyl="cd \${HOME}/.hexyl"
    alias zhexyl="cd \${HOME}/.config/hexyl"

    if alias apinithexylshare &>/dev/null; then
        apinithexylshare
    fi

    if alias apinithexylcommon &>/dev/null; then
        apinithexylcommon
    fi

    if alias apinithexylmain &>/dev/null; then
        apinithexylmain
    fi
}

alias apcreatedirstructhexyl="ap_func_create_dirstruct_hexyl"
ap_func_create_dirstruct_hexyl() {
    if [ -f "${AP_SOFT_DIR}/hexyl/hexyl" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/hexyl] to [${AP_SOFT_DIR}/hexyl/hexyl]\n"
        ln -sf "${AP_SOFT_DIR}/hexyl/hexyl" "${AP_SOFT_DIR}/bin/hexyl"
    fi

    if [ -f "${AP_SOFT_DIR}/hexyl/hexyl.1" ]; then
        apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/hexyl.1] to [${AP_SOFT_DIR}/hexyl/hexyl.1]\n"
        ln -sf "${AP_SOFT_DIR}/hexyl/hexyl.1" "${AP_MAN_DIR}/man1/hexyl.1"
    fi

    if alias apcreatedirstructhexylshare &>/dev/null; then
        apcreatedirstructhexylshare
    fi

    if alias apcreatedirstructhexylcommon &>/dev/null; then
        apcreatedirstructhexylcommon
    fi

    if alias apcreatedirstructhexylmain &>/dev/null; then
        apcreatedirstructhexylmain
    fi
}

alias aprmdirstructhexyl="ap_func_rm_dirstruct_hexyl"
ap_func_rm_dirstruct_hexyl() {
    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/hexyl]\n"
    rm -f "${AP_SOFT_DIR}/bin/hexyl"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/hexyl.1]\n"
    rm -f "${AP_MAN_DIR}/man1/hexyl.1"

    if alias aprmdirstructhexylshare &>/dev/null; then
        aprmdirstructhexylshare
    fi

    if alias aprmdirstructhexylcommon &>/dev/null; then
        aprmdirstructhexylcommon
    fi

    if alias aprmdirstructhexylmain &>/dev/null; then
        aprmdirstructhexylmain
    fi
}

alias apcreateglobalsymlinkhexyl="ap_func_create_global_symlink_hexyl"
ap_func_create_global_symlink_hexyl() {
    if [ -f "${AP_SOFT_DIR}/bin/hexyl" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/hexyl] to [${AP_SOFT_DIR}/bin/hexyl]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/hexyl" "/usr/local/bin/hexyl"
    fi
}

alias aprmglobalsymlinkhexyl="ap_func_rm_global_symlink_hexyl"
ap_func_rm_global_symlink_hexyl() {
    apshowmsginfo "Remove [/usr/local/bin/hexyl]\n"
    sudo rm -f "/usr/local/bin/hexyl"
}

alias apsetuphexyl="ap_func_setup_hexyl"
ap_func_setup_hexyl() {
    apshowmsginfo "Install [hexyl]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/hexyl"
    rm -rf "${AP_TMP_DIR}/hexyl"

    # Install hexyl
    mkdir -p "${AP_TMP_DIR}/hexyl"
    cd "${AP_TMP_DIR}/hexyl"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/sharkdp/hexyl/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep aarch64)" >hexyl.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/sharkdp/hexyl/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep x86_64)" >hexyl.tar.gz
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/sharkdp/hexyl/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep gnu)" >hexyl.tar.gz
    fi

    tar -zxf hexyl.tar.gz
    rm -f hexyl.tar.gz

    mv hexyl* hexyl
    mv hexyl "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/hexyl"
    rm -rf "${AP_TMP_DIR}/hexyl"

    apinithexyl
    apcreateglobalsymlinkhexyl

    if alias apcreatedirstructhexyl &>/dev/null; then
        apcreatedirstructhexyl
    fi
}

alias aprmhexyl="ap_func_rm_hexyl"
ap_func_rm_hexyl() {
    apshowmsginfo "Remove [hexyl]\n"

    rm -rf "${AP_SOFT_DIR}/hexyl"

    if alias aprmdirstructhexyl &>/dev/null; then
        aprmdirstructhexyl
    fi

    if alias aprmglobalsymlinkhexyl &>/dev/null; then
        aprmglobalsymlinkhexyl
    fi
}
