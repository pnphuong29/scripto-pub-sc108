alias @initdbeaver="ap_func_init_dbeaver"
ap_func_init_dbeaver() {
    AP_DBEAVER_WS_DIR="${HOME}/Library/DBeaverData"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        AP_DBEAVER_WS_DIR="${HOME}/snap/dbeaver-ce/current/.local/share/DBeaverData"
    fi
    export AP_DBEAVER_WS_DIR
}

alias @setupdbeaver="ap_func_setup_dbeaver"
ap_func_setup_dbeaver() {
    @logshow "Install [dbeaver]\n"

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
}
