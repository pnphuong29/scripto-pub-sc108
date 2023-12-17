alias @setuphyper="ap_func_setup_hyper"
ap_func_setup_hyper() {
    @logshow "Install [hyper]\n"

    # Remove old app dir if any
    rm -rf "${AP_TMP_DIR}/hyper"*

    # Install hyper
    mkdir -p "${AP_TMP_DIR}/hyper"
    cd "${AP_TMP_DIR}/hyper"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/vercel/hyper/releases | jq -r '.[].assets[].browser_download_url' | grep -v canary | grep "mac-x64.zip$" | head -1)" >hyper.zip
        unzip hyper.zip
        mv Hyper.app /Applications/
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/vercel/hyper/releases | jq -r '.[].assets[].browser_download_url' | grep -v canary | grep "amd64.deb$" | head -1)" >hyper.deb
        sudo dpkg -i hyper.deb
    fi

    if alias @createdirstructhyper &>/dev/null; then
        @createdirstructhyper
    fi
}

alias @rmhyper="ap_func_remove_hyper"
ap_func_remove_hyper() {
    @logshow "Remove [hyper]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf /Applications/Hyper.app
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge hyper
    fi

    if alias @rmdirstructhyper &>/dev/null; then
        @rmdirstructhyper
    fi
}
