alias @initipython="ap_func_init_ipython"
ap_func_init_ipython() {
    if alias @initipythonshare &>/dev/null; then
        @initipythonshare
    fi

    if alias @initipythoncommon &>/dev/null; then
        @initipythoncommon
    fi
}

alias @createdirstructipython="ap_func_create_dirstruct_ipython"
ap_func_create_dirstruct_ipython() {
    if alias @createdirstructipythonshare &>/dev/null; then
        @createdirstructipythonshare
    fi

    if alias @createdirstructipythoncommon &>/dev/null; then
        @createdirstructipythoncommon
    fi
}

alias @rmdirstructipython="ap_func_rm_dirstruct_ipython"
ap_func_rm_dirstruct_ipython() {
    if alias @rmdirstructipythonshare &>/dev/null; then
        @rmdirstructipythonshare
    fi

    if alias @rmdirstructipythoncommon &>/dev/null; then
        @rmdirstructipythoncommon
    fi
}

alias @createglobalsymlinkipython="ap_func_create_global_symlink_ipython"
ap_func_create_global_symlink_ipython() {
    if [ -f "${AP_SOFT_DIR}/bin/ipython" ]; then
        @logshow "Create symlink from [/usr/local/bin/ipython] to [${AP_SOFT_DIR}/bin/ipython]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/ipython" "/usr/local/bin/ipython"
    fi
}

alias @rmglobalsymlinkipython="ap_func_rm_global_symlink_ipython"
ap_func_rm_global_symlink_ipython() {
    if [ -f "/usr/local/bin/ipython" ]; then
        @logshow "Remove [/usr/local/bin/ipython]\n"
        sudo rm -f "/usr/local/bin/ipython"
    fi
}

alias @setupipython="ap_func_setup_ipython"
ap_func_setup_ipython() {
    @logshow "Install [ipython]\n"

    local ap_ipython_setup_version=''
    if [ -n "$1" ]; then
        ap_ipython_setup_version="$1"
    fi

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/ipython"
    rm -rf "${AP_TMP_DIR}/ipython"

    # Install ipython
    mkdir -p "${AP_TMP_DIR}/ipython"
    cd "${AP_TMP_DIR}/ipython"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/owner/ipython/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >ipython.tar.gz
        unzip ipython.zip
        mv ipython* ipython
        rm -rf "/Applications/ipython"
        mv "ipython/ipython.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse ipython.dmg
        cd "/Volumes/ipython"
        cp -R ipython.app /Applications/
        hdiutil detach "/Volumes/ipython"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/owner/ipython/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep "musl")" >ipython.tar.gz
        sudo dpkg -i ipython.deb
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/ipython/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >ipython.tar.gz

    tar -zxf ipython.tar.gz
    rm -f ipython.tar.gz
    mv ipython* ipython
    mv ipython "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/ipython"
    rm -rf "${AP_TMP_DIR}/ipython"

    @initipython
    if alias @createdirstructipython &>/dev/null; then
        @createdirstructipython
    fi
}

alias @rmipython="ap_func_rm_ipython"
ap_func_rm_ipython() {
    @logshow "Remove [ipython]\n"
    rm -rf "${AP_SOFT_DIR}/ipython"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask ipython
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y ipython
    fi

    if alias @rmdirstructipython &>/dev/null; then
        @rmdirstructipython
    fi

    if alias @rmglobalsymlinkipython &>/dev/null; then
        @rmglobalsymlinkipython
    fi
}
