alias @initjoshuto="ap_func_init_joshuto"
ap_func_init_joshuto() {
    export JOSHUTO_CONFIG_HOME="${HOME}/scripto/vendors/joshuto/configs"
    alias 2joshutodocs="open https://github.com/kamiyaa/joshuto/tree/main/docs"
    alias viscjoshuto="vi -p \
        \${HOME}/scripto/vendors/ap_vendor_joshuto.sh \
        \${HOME}/scripto-common/vendors/ap_vendor_joshuto.sh \
        \${HOME}/scripto/vendors/joshuto/configs/joshuto.toml \
        \${HOME}/scripto/vendors/joshuto/configs/keymap.toml \
        \${HOME}/scripto/vendors/joshuto/configs/mimetype.toml \
        \${HOME}/scripto/vendors/joshuto/configs/bookmarks.toml \
        \${HOME}/scripto/vendors/joshuto/configs/preview_file.sh \
    "

    if alias @initjoshutocommon &>/dev/null; then
        @initjoshutocommon
    fi
}

alias @createdirstructjoshuto="ap_func_create_dirstruct_joshuto"
ap_func_create_dirstruct_joshuto() {
    # Preview image cache dir
    @logshow "Create directories [${AP_TMP_DIR}/joshuto/preview-image-cache]\n"
    mkdir -p "${AP_TMP_DIR}/joshuto/preview-image-cache"

    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/joshuto_wrapper] to [${HOME}/scripto/vendors/joshuto/bin/joshuto_wrapper.sh]\n"
    ln -sf "${HOME}/scripto/vendors/joshuto/bin/joshuto_wrapper.sh" "${AP_SOFT_DIR}/bin/joshuto_wrapper"

    if alias @createdirstructjoshutocommon &>/dev/null; then
        @createdirstructjoshutocommon
    fi
}

alias @rmdirstructjoshuto="ap_func_remove_dirstruct_joshuto"
ap_func_remove_dirstruct_joshuto() {
    @logshow "Remove [${AP_TMP_DIR}/joshuto/preview-image-cache]\n"
    rm -rf "${AP_TMP_DIR}/joshuto/preview-image-cache"

    @logshow "Remove [${AP_SOFT_DIR}/bin/joshuto_wrapper]\n"
    rm -f "${AP_SOFT_DIR}/bin/joshuto_wrapper"

    if alias @rmdirstructjoshutocommon &>/dev/null; then
        @rmdirstructjoshutocommon
    fi
}

alias @createglobalsymlinkjoshuto="ap_func_create_global_symlink_joshuto"
ap_func_create_global_symlink_joshuto() {
    if [ -f "${AP_SOFT_DIR}/joshuto/joshuto" ]; then
        @logshow "Create symlink from [/usr/local/bin/joshuto] to [${AP_SOFT_DIR}/bin/joshuto]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/joshuto" "/usr/local/bin/joshuto"
    fi
}

alias @rmglobalsymlinkjoshuto="ap_func_remove_global_symlink_joshuto"
ap_func_remove_global_symlink_joshuto() {
    if [ -f "/usr/local/bin/joshuto" ]; then
        @logshow "Remove [/usr/local/bin/joshuto]\n"
        sudo rm -f "/usr/local/bin/joshuto"
    fi
}

alias @setupjoshuto="ap_func_setup_joshuto"
ap_func_setup_joshuto() {
    # https://github.com/kamiyaa/joshuto
    @logshow "Install [joshuto]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/joshuto"
    rm -rf "${AP_TMP_DIR}/joshuto"

    # Install joshuto
    mkdir -p "${AP_TMP_DIR}/joshuto"
    cd "${AP_TMP_DIR}/joshuto"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/kamiyaa/joshuto/releases | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep x86_64 | grep -v sha256)" >joshuto.tar.gz
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/kamiyaa/joshuto/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep "musl")" >joshuto.tar.gz
    fi

    tar -zxf joshuto.tar.gz
    rm -f joshuto.tar.gz
    mv joshuto* joshuto
    mv joshuto/joshuto "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/joshuto"

    if alias @createdirstructjoshuto &>/dev/null; then
        @createdirstructjoshuto
    fi
}

alias @rmjoshuto="ap_func_remove_joshuto"
ap_func_remove_joshuto() {
    @logshow "Remove [joshuto]\n"

    rm -f "${AP_SOFT_DIR}/bin/joshuto"

    if alias @rmdirstructjoshuto &>/dev/null; then
        @rmdirstructjoshuto
    fi

    if alias @rmglobalsymlinkjoshuto &>/dev/null; then
        @rmglobalsymlinkjoshuto
    fi
}
