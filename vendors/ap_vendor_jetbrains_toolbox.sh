alias apinitjetbrainstoolbox="ap_func_init_jetbrainstoolbox"
ap_func_init_jetbrainstoolbox() {
    export AP_JB_TOOLBOX_SETUP_VERSION='2.5.4.38621'

    if alias apinitjetbrainstoolboxshare &>/dev/null; then
        apinitjetbrainstoolboxshare
    fi

    if alias apinitjetbrainstoolboxcommon &>/dev/null; then
        apinitjetbrainstoolboxcommon
    fi

    if alias apinitjetbrainstoolboxmain &>/dev/null; then
        apinitjetbrainstoolboxmain
    fi
}

alias apcreatedirstructjetbrainstoolbox="ap_func_create_dirstruct_jetbrainstoolbox"
ap_func_create_dirstruct_jetbrainstoolbox() {
    if alias apcreatedirstructjetbrainstoolboxshare &>/dev/null; then
        apcreatedirstructjetbrainstoolboxshare
    fi

    if alias apcreatedirstructjetbrainstoolboxcommon &>/dev/null; then
        apcreatedirstructjetbrainstoolboxcommon
    fi

    if alias apcreatedirstructjetbrainstoolboxmain &>/dev/null; then
        apcreatedirstructjetbrainstoolboxmain
    fi
}

alias aprmdirstructjetbrainstoolbox="ap_func_rm_dirstruct_jetbrainstoolbox"
ap_func_rm_dirstruct_jetbrainstoolbox() {
    if alias aprmdirstructjetbrainstoolboxshare &>/dev/null; then
        aprmdirstructjetbrainstoolboxshare
    fi

    if alias aprmdirstructjetbrainstoolboxcommon &>/dev/null; then
        aprmdirstructjetbrainstoolboxcommon
    fi

    if alias aprmdirstructjetbrainstoolboxmain &>/dev/null; then
        aprmdirstructjetbrainstoolboxmain
    fi
}

alias apsetupjetbrainstoolbox="ap_func_setup_jetbrainstoolbox"
ap_func_setup_jetbrainstoolbox() {
    local ap_jetbrainstoolbox_setup_version="${AP_JB_TOOLBOX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_jetbrainstoolbox_setup_version="$1"
    fi

    apshowmsginfo "Install [jetbrains toolbox] version [${ap_jetbrainstoolbox_setup_version}]\n"

    # Remove old app dir if any
    rm -rf "${AP_TMP_DIR}/jetbrainstoolbox"

    # Install jetbrainstoolbox
    mkdir -p "${AP_TMP_DIR}/jetbrainstoolbox"
    cd "${AP_TMP_DIR}/jetbrainstoolbox"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL "https://download.jetbrains.com/toolbox/jetbrains-toolbox-${ap_jetbrainstoolbox_setup_version}-arm64.dmg" >toolbox.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL "https://download.jetbrains.com/toolbox/jetbrains-toolbox-${ap_jetbrainstoolbox_setup_version}.dmg" >toolbox.dmg
        fi

        rm -rf "/Applications/JetBrains Toolbox"
        hdiutil attach -nobrowse toolbox.dmg
        cp -R "/Volumes/JetBrains Toolbox/JetBrains Toolbox.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/JetBrains Toolbox"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin tar dbus-user-session
        curl -SL "https://download.jetbrains.com/toolbox/jetbrains-toolbox-${ap_jetbrainstoolbox_setup_version}.tar.gz" >toolbox.tar.gz
        tar -zxf toolbox.tar.gz
        mv jetbrains-toolbox-* toolbox
        mv toolbox/jetbrains-toolbox "${AP_SOFT_DIR}/bin/"
        # rm -rf "${AP_TMP_DIR}/jetbrainstoolbox"
    fi

    apinitjetbrainstoolbox

    if alias apcreateglobalsymlinkjetbrainstoolbox &>/dev/null; then
        apcreatedirstructjetbrainstoolbox
    fi

    if alias apcreatedirstructjetbrainstoolbox &>/dev/null; then
        apcreatedirstructjetbrainstoolbox
    fi
}

alias aprmjetbrainstoolbox="ap_func_rm_jetbrainstoolbox"
ap_func_rm_jetbrainstoolbox() {
    local ap_jetbrainstoolbox_remove_version="${AP_JB_TOOLBOX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_jetbrainstoolbox_remove_version="$1"
    fi

    apshowmsginfo "Remove [jetbrains toolbox] v${ap_jetbrainstoolbox_remove_version}\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/JetBrains Toolbox"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -f "${AP_SOFT_DIR}/bin/jetbrains-toolbox"
    fi

    if alias aprmdirstructjetbrainstoolbox &>/dev/null; then
        aprmdirstructjetbrainstoolbox
    fi

    if alias aprmglobalsymlinkjetbrainstoolbox &>/dev/null; then
        aprmglobalsymlinkjetbrainstoolbox
    fi
}
