alias @initxxx="ap_func_init_xxx"
ap_func_init_xxx() {
    if alias @initxxxcommon &>/dev/null; then
        @initxxxcommon
    fi
}

alias @initxxxcommon="ap_func_init_xxx_common"
ap_func_init_xxx_common() {

}

alias @createdirstructxxx="ap_func_create_dirstruct_xxx"
ap_func_create_dirstruct_xxx() {
    @logshow "Generate [xxx] bash autocomplete\n"
    xxx >"${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/xxx] to [${AP_SOFT_DIR}/xxx/bin/xxx]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/bin/xxx" "${AP_SOFT_DIR}/bin/xxx"

    @logshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash] to [${AP_SOFT_DIR}/xxx/complete/xxx.bash]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/autocomplete/xxx.bash" "${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    @logshow "Create symlink from [${AP_MAN_DIR}/man1/xxx.1] to [${AP_SOFT_DIR}/xxx/xxx.1]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/xxx.1" "${AP_MAN_DIR}/man1/xxx.1"

    if alias @createdirstructxxxcommon &>/dev/null; then
        @createdirstructxxxcommon
    fi
}

alias @createdirstructxxxcommon="ap_func_create_dirstruct_xxx_common"
ap_func_create_dirstruct_xxx_common() {

}

alias @rmdirstructxxx="ap_func_remove_dirstruct_xxx"
ap_func_remove_dirstruct_xxx() {
    @logshow "Remove [${AP_SOFT_DIR}/bin/xxx]\n"
    rm -f "${AP_SOFT_DIR}/bin/xxx"

    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    @logshow "Remove [${AP_MAN_DIR}/man1/xxx.1]\n"
    rm -f "${AP_MAN_DIR}/man1/xxx.1"

    if alias @rmdirstructxxxcommon &>/dev/null; then
        @rmdirstructxxxcommon
    fi
}

alias @rmdirstructxxxcommon="ap_func_remove_dirstruct_xxx_common"
ap_func_remove_dirstruct_xxx_common() {

}

alias @createglobalsymlinkxxx="ap_func_create_global_symlink_xxx"
ap_func_create_global_symlink_xxx() {
    if [ -f "${AP_SOFT_DIR}/xxx/xxx" ]; then
        @logshow "Create symlink from [/usr/local/bin/xxx] to [${AP_SOFT_DIR}/xxx/xxx]\n"
        sudo ln -sf "${AP_SOFT_DIR}/xxx/xxx" "/usr/local/bin/xxx"
    fi
}

alias @rmglobalsymlinkxxx="ap_func_remove_global_symlink_xxx"
ap_func_remove_global_symlink_xxx() {
    if [ -f "/usr/local/bin/xxx" ]; then
        @logshow "Remove [/usr/local/bin/xxx]\n"
        sudo rm -f "/usr/local/bin/xxx"
    fi
}

alias @setupxxx="ap_func_setup_xxx"
ap_func_setup_xxx() {
    @logshow "Install [xxx]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/xxx"
    rm -rf "${AP_TMP_DIR}/xxx"

    # Install xxx
    mkdir -p "${AP_TMP_DIR}/xxx"
    cd "${AP_TMP_DIR}/xxx"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/owner/xxx/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >xxx.tar.gz
        unzip xxx.zip
        mv xxx* xxx
        rm -rf "/Applications/xxx"
        mv "xxx/xxx.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse xxx.dmg
        cd "/Volumes/xxx"
        cp -R xxx.app /Applications/
        hdiutil detach "/Volumes/xxx"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/owner/xxx/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep "musl")" >xxx.tar.gz
        sudo dpkg -i xxx.deb
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/xxx/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >xxx.tar.gz

    tar -zxf xxx.tar.gz
    rm -f xxx.tar.gz
    mv xxx* xxx
    mv xxx "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/xxx"
    rm -rf "${AP_TMP_DIR}/xxx"

    if alias @createdirstructxxx &>/dev/null; then
        @createdirstructxxx
    fi
}

alias @rmxxx="ap_func_remove_xxx"
ap_func_remove_xxx() {
    @logshow "Remove [xxx]\n"
    rm -rf "${AP_SOFT_DIR}/xxx"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask xxx
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y xxx
    fi

    if alias @rmdirstructxxx &>/dev/null; then
        @rmdirstructxxx
    fi

    if alias @rmglobalsymlinkxxx &>/dev/null; then
        @rmglobalsymlinkxxx
    fi
}
