alias apinitpycharm="ap_func_init_pycharm"
ap_func_init_pycharm() {
    export AP_PYCHARM_SETUP_VERSION='2024.3.4'

    if alias apinitpycharmshare &>/dev/null; then
        apinitpycharmshare
    fi

    if alias apinitpycharmcommon &>/dev/null; then
        apinitpycharmcommon
    fi

    if alias apinitpycharmmain &>/dev/null; then
        apinitpycharmmain
    fi
}

alias apcreatedirstructpycharm="ap_func_create_dirstruct_pycharm"
ap_func_create_dirstruct_pycharm() {
    if [ -f "${AP_SOFT_DIR}/pycharm/bin/pycharm" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/pycharm] to [${AP_SOFT_DIR}/pycharm/bin/pycharm]\n"
        ln -sf "${AP_SOFT_DIR}/pycharm/bin/pycharm" "${AP_SOFT_DIR}/bin/pycharm"
    fi

    if alias apcreatedirstructpycharmshare &>/dev/null; then
        apcreatedirstructpycharmshare
    fi

    if alias apcreatedirstructpycharmcommon &>/dev/null; then
        apcreatedirstructpycharmcommon
    fi

    if alias apcreatedirstructpycharmmain &>/dev/null; then
        apcreatedirstructpycharmmain
    fi
}

alias aprmdirstructpycharm="ap_func_rm_dirstruct_pycharm"
ap_func_rm_dirstruct_pycharm() {
    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/pycharm]\n"
    rm -f "${AP_SOFT_DIR}/bin/pycharm"

    if alias aprmdirstructpycharmshare &>/dev/null; then
        aprmdirstructpycharmshare
    fi

    if alias aprmdirstructpycharmcommon &>/dev/null; then
        aprmdirstructpycharmcommon
    fi

    if alias aprmdirstructpycharmmain &>/dev/null; then
        aprmdirstructpycharmmain
    fi
}

alias apsetuppycharm="ap_func_setup_pycharm"
ap_func_setup_pycharm() {
    local ap_pycharm_setup_version="${AP_PYCHARM_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_pycharm_setup_version="$1"
    fi

    apshowmsginfo "Install [pycharm] version [${ap_pycharm_setup_version}]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/pycharm"
    rm -rf "${AP_TMP_DIR}/pycharm"

    # Install pycharm
    mkdir -p "${AP_TMP_DIR}/pycharm"
    cd "${AP_TMP_DIR}/pycharm"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            apshowmsginfo "Download [pycharm] version [${ap_pycharm_setup_version}] from [https://download-cdn.jetbrains.com/python/pycharm-community-${AP_PYCHARM_SETUP_VERSION}-aarch64.dmg]\n"
            curl -SL "https://download-cdn.jetbrains.com/python/pycharm-community-${AP_PYCHARM_SETUP_VERSION}-aarch64.dmg" >pycharm.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            apshowmsginfo "Download [pycharm] version [${ap_pycharm_setup_version}] from [https://download-cdn.jetbrains.com/python/pycharm-community-${AP_PYCHARM_SETUP_VERSION}.dmg]\n"
            curl -SL "https://download-cdn.jetbrains.com/python/pycharm-community-${AP_PYCHARM_SETUP_VERSION}.dmg" >pycharm.dmg
        fi

        rm -rf "/Applications/PyCharm CE.app"

        hdiutil attach -nobrowse pycharm.dmg
        cp -R "/Volumes/PyCharm CE/PyCharm CE.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/PyCharm CE"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        apshowmsginfo "Download [pycharm] version [${ap_pycharm_setup_version}] from [https://download-cdn.jetbrains.com/python/pycharm-community-${AP_PYCHARM_SETUP_VERSION}.tar.gz]\n"
        curl -SL "https://download-cdn.jetbrains.com/python/pycharm-community-${AP_PYCHARM_SETUP_VERSION}.tar.gz" >pycharm.tar.gz
    fi

    tar -zxf pycharm.tar.gz
    rm -f pycharm.tar.gz

    mv pycharm* pycharm
    mv pycharm "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/pycharm"
    # rm -rf "${AP_TMP_DIR}/pycharm"

    apinitpycharm

    if alias apcreatedirstructpycharm &>/dev/null; then
        apcreatedirstructpycharm
    fi
}

alias aprmpycharm="ap_func_rm_pycharm"
ap_func_rm_pycharm() {
    local ap_pycharm_remove_version="${AP_PYCHARM_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_pycharm_remove_version="$1"
    fi

    apshowmsginfo "Remove [pycharm] v${ap_pycharm_remove_version}\n"

    rm -rf "${AP_SOFT_DIR}/pycharm"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/PyCharm CE.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${AP_SOFT_DIR}/pycharm"
    fi

    if alias aprmdirstructpycharm &>/dev/null; then
        aprmdirstructpycharm
    fi

    if alias aprmglobalsymlinkpycharm &>/dev/null; then
        aprmglobalsymlinkpycharm
    fi
}
