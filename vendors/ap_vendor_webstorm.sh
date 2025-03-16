alias apinitwebstorm="ap_func_init_webstorm"
ap_func_init_webstorm() {
    export AP_WEBSTORM_SETUP_VERSION='2024.3.5'

    if alias apinitwebstormshare &>/dev/null; then
        apinitwebstormshare
    fi

    if alias apinitwebstormcommon &>/dev/null; then
        apinitwebstormcommon
    fi

    if alias apinitwebstormmain &>/dev/null; then
        apinitwebstormmain
    fi
}

alias apcreatedirstructwebstorm="ap_func_create_dirstruct_webstorm"
ap_func_create_dirstruct_webstorm() {
    if [ -f "${AP_SOFT_DIR}/webstorm/bin/webstorm" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/webstorm] to [${AP_SOFT_DIR}/webstorm/bin/webstorm]\n"
        ln -sf "${AP_SOFT_DIR}/webstorm/bin/webstorm" "${AP_SOFT_DIR}/bin/webstorm"
    fi

    if alias apcreatedirstructwebstormshare &>/dev/null; then
        apcreatedirstructwebstormshare
    fi

    if alias apcreatedirstructwebstormcommon &>/dev/null; then
        apcreatedirstructwebstormcommon
    fi

    if alias apcreatedirstructwebstormmain &>/dev/null; then
        apcreatedirstructwebstormmain
    fi
}

alias aprmdirstructwebstorm="ap_func_rm_dirstruct_webstorm"
ap_func_rm_dirstruct_webstorm() {
    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/webstorm]\n"
    rm -f "${AP_SOFT_DIR}/bin/webstorm"

    if alias aprmdirstructwebstormshare &>/dev/null; then
        aprmdirstructwebstormshare
    fi

    if alias aprmdirstructwebstormcommon &>/dev/null; then
        aprmdirstructwebstormcommon
    fi

    if alias aprmdirstructwebstormmain &>/dev/null; then
        aprmdirstructwebstormmain
    fi
}

alias apsetupwebstorm="ap_func_setup_webstorm"
ap_func_setup_webstorm() {
    local ap_webstorm_setup_version="${AP_WEBSTORM_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_webstorm_setup_version="$1"
    fi

    apshowmsginfo "Install [webstorm] version [${ap_webstorm_setup_version}]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/webstorm"
    rm -rf "${AP_TMP_DIR}/webstorm"

    # Install webstorm
    mkdir -p "${AP_TMP_DIR}/webstorm"
    cd "${AP_TMP_DIR}/webstorm"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            apshowmsginfo "Download [webstorm] version [${ap_webstorm_setup_version}] from [https://download-cdn.jetbrains.com/webstorm/WebStorm-${AP_WEBSTORM_SETUP_VERSION}-aarch64.dmg]\n"
            curl -SL "https://download-cdn.jetbrains.com/webstorm/WebStorm-${AP_WEBSTORM_SETUP_VERSION}-aarch64.dmg" >webstorm.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            apshowmsginfo "Download [webstorm] version [${ap_webstorm_setup_version}] from [https://download-cdn.jetbrains.com/webstorm/WebStorm-${AP_WEBSTORM_SETUP_VERSION}.dmg]\n"
            curl -SL "https://download-cdn.jetbrains.com/webstorm/WebStorm-${AP_WEBSTORM_SETUP_VERSION}.dmg" >webstorm.dmg
        fi

        rm -rf "/Applications/WebStorm.app"

        hdiutil attach -nobrowse webstorm.dmg
        cp -R "/Volumes/WebStorm/WebStorm.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/WebStorm"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        apshowmsginfo "Download [webstorm] version [${ap_webstorm_setup_version}] from [https://download-cdn.jetbrains.com/webstorm/WebStorm-${AP_WEBSTORM_SETUP_VERSION}.tar.gz]\n"
        curl -SL "https://download-cdn.jetbrains.com/webstorm/WebStorm-${AP_WEBSTORM_SETUP_VERSION}.tar.gz" >webstorm.tar.gz

        tar -zxf webstorm.tar.gz
        mv WebStorm* webstorm
        mv webstorm "${AP_SOFT_DIR}/"
        cd "${AP_SOFT_DIR}/webstorm"
    fi

    # rm -rf "${AP_TMP_DIR}/webstorm"

    apinitwebstorm

    if alias apcreatedirstructwebstorm &>/dev/null; then
        apcreatedirstructwebstorm
    fi
}

alias aprmwebstorm="ap_func_rm_webstorm"
ap_func_rm_webstorm() {
    local ap_webstorm_remove_version="${AP_WEBSTORM_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_webstorm_remove_version="$1"
    fi

    apshowmsginfo "Remove [webstorm] v${ap_webstorm_remove_version}\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/WebStorm.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${AP_SOFT_DIR}/webstorm"
    fi

    if alias aprmdirstructwebstorm &>/dev/null; then
        aprmdirstructwebstorm
    fi

    if alias aprmglobalsymlinkwebstorm &>/dev/null; then
        aprmglobalsymlinkwebstorm
    fi
}
