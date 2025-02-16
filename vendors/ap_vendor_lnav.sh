alias apinitlnav="ap_func_init_lnav"
ap_func_init_lnav() {
    export AP_LNAV_CONF_DIR="${HOME}/.config/lnav"
    alias zlnavconfig="cd \${HOME}/.config/lnav"

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
    # if [ -f "${HOME}/scripto-share/vendors/lnav/bindings.json" ]; then
    #     apshowmsginfo "Create symlink from [${HOME}/.config/lnav/bindings.json] to [${HOME}/scripto-share/vendors/lnav/bindings.json]\n"
    #     ln -sf "${HOME}/scripto-share/vendors/lnav/bindings.json" "${HOME}/.config/lnav/bindings.json"
    # fi

    if [ -f "${AP_SOFT_DIR}/lnav/lnav" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/lnav] to [${AP_SOFT_DIR}/lnav/lnav]\n"
        ln -sf "${AP_SOFT_DIR}/lnav/lnav" "${AP_SOFT_DIR}/bin/lnav"
    fi

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/lnav.1] to [${AP_SOFT_DIR}/lnav/lnav.1]\n"
    ln -sf "${AP_SOFT_DIR}/lnav/lnav.1" "${AP_MAN_DIR}/man1/lnav.1"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     if [ -f "${HOME}/scripto-common/vendors/lnav/config.mac.env" ]; then
    #         if [ -d "${XDG_CONFIG_HOME}" ]; then
    #             mkdir -p "${XDG_CONFIG_HOME}/lnav"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.base.env" "${XDG_CONFIG_HOME}/lnav/config.base.env"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.key.mac.env" "${XDG_CONFIG_HOME}/lnav/config.key.mac.env"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.mac.env" "${XDG_CONFIG_HOME}/lnav/config"
    #         else
    #             mkdir -p "${HOME}/Library/Application Support/com.mitchellh.lnav"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.lnav/config.base.env"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.lnav/config.key.mac.env"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.lnav/config"
    #         fi
    #     fi
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     if [ -f "${HOME}/scripto-common/vendors/lnav/config.linux.env" ]; then
    #         if [ -d "${XDG_CONFIG_HOME}" ]; then
    #             mkdir -p "${XDG_CONFIG_HOME}/lnav"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.base.env" "${XDG_CONFIG_HOME}/lnav/config.base.env"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.key.linux.env" "${XDG_CONFIG_HOME}/lnav/config.key.linux.env"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.linux.env" "${XDG_CONFIG_HOME}/lnav/config"
    #         else
    #             mkdir -p "${HOME}/.config/lnav"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.base.env" "${HOME}/.config/lnav/config.base.env"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.key.linux.env" "${HOME}/.config/lnav/config.key.linux.env"
    #             ln -sf "${HOME}/scripto-common/vendors/lnav/config.linux.env" "${HOME}/.config/lnav/config"
    #         fi
    #     fi
    # fi

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
    apshowmsginfo "Remove [${HOME}/.config/lnav/]\n"
    rm -rf "${HOME}/.config/lnav/"

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
