alias @initdbeaver="ap_func_init_dbeaver"
ap_func_init_dbeaver() {
    AP_DBEAVER_WS_DIR="${HOME}/Library/DBeaverData"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        AP_DBEAVER_WS_DIR="${HOME}/snap/dbeaver-ce/current/.local/share/DBeaverData"
    fi
    export AP_DBEAVER_WS_DIR

    if alias @initdbeavershare &>/dev/null; then
        @initdbeavershare
    fi

    if alias @initdbeavercommon &>/dev/null; then
        @initdbeavercommon
    fi
}

alias @createdirstructdbeaver="ap_func_create_dirstruct_dbeaver"
ap_func_create_dirstruct_dbeaver() {
    if alias @createdirstructdbeavershare &>/dev/null; then
        @createdirstructdbeavershare
    fi

    if alias @createdirstructdbeavercommon &>/dev/null; then
        @createdirstructdbeavercommon
    fi
}

alias @rmdirstructdbeaver="ap_func_remove_dirstruct_dbeaver"
ap_func_remove_dirstruct_dbeaver() {
    if alias @rmdirstructdbeavershare &>/dev/null; then
        @rmdirstructdbeavershare
    fi

    if alias @rmdirstructdbeavercommon &>/dev/null; then
        @rmdirstructdbeavercommon
    fi
}

alias @setupdbeaver="ap_func_setup_dbeaver"
ap_func_setup_dbeaver() {
    @logshow "Install [Dbeaver]\n"

    # Remove old app dir if any
    rm -rf "${AP_TMP_DIR}/dbeaver"

    # Install dbeaver
    mkdir -p "${AP_TMP_DIR}/dbeaver"
    cd "${AP_TMP_DIR}/dbeaver"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/dbeaver/dbeaver/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos-x86_64.dmg$")" >dbeaver.dmg
        hdiutil attach -nobrowse dbeaver.dmg
        cd "/Volumes/DBeaver Community"
        cp -R DBeaver.app /Applications/
        hdiutil detach "/Volumes/DBeaver Community"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/dbeaver/dbeaver/releases | jq -r '.[0].assets[].browser_download_url' | grep "amd64.deb$")" >dbeaver.deb
        sudo dpkg -i dbeaver.deb
    fi

    @initdbeaver

    if alias @createdirstructdbeaver &>/dev/null; then
        @createdirstructdbeaver
    fi
}

alias @rmdbeaver="ap_func_remove_dbeaver"
ap_func_remove_dbeaver() {
    @logshow "Remove [dbeaver]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Dbeaver.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge dbeaver
    fi

    if alias @rmdirstructdbeaver &>/dev/null; then
        @rmdirstructdbeaver
    fi

    if alias @rmglobalsymlinkdbeaver &>/dev/null; then
        @rmglobalsymlinkdbeaver
    fi
}
