alias @createdirstructripgrepall="ap_func_create_dirstruct_ripgrepall"
ap_func_create_dirstruct_ripgrepall() {
    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/rga] to [${AP_SOFT_DIR}/ripgrep-all/rga]\n"
    ln -sf "${AP_SOFT_DIR}/ripgrep-all/rga" "${AP_SOFT_DIR}/bin/rga"

    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/rga-preproc] to [${AP_SOFT_DIR}/ripgrep-all/rga-preproc]\n"
    ln -sf "${AP_SOFT_DIR}/ripgrep-all/rga-preproc" "${AP_SOFT_DIR}/bin/rga-preproc"

    # @logshow "Create symlink from [${AP_MAN_DIR}/man1/rga.1] to [${AP_SOFT_DIR}/ripgrep-all/doc/rga.1]\n"
    # ln -sf "${AP_SOFT_DIR}/ripgrep-all/doc/rga.1" "${AP_MAN_DIR}/man1/rga.1"
}

alias @rmdirstructripgrepall="ap_func_rm_dirstruct_ripgrepall"
ap_func_rm_dirstruct_ripgrepall() {
    @logshow "Remove [${AP_SOFT_DIR}/bin/rga]\n"
    rm -f "${AP_SOFT_DIR}/bin/rga"

    @logshow "Remove [${AP_SOFT_DIR}/bin/rga-preproc]\n"
    rm -f "${AP_SOFT_DIR}/bin/rga-preproc"

    # @logshow "Remove [${AP_MAN_DIR}/man1/rga.1]\n"
    # rm -f "${AP_MAN_DIR}/man1/rga.1"
}

alias @createglobalsymlinkripgrepall="ap_func_create_global_symlink_ripgrepall"
ap_func_create_global_symlink_ripgrepall() {
    if [ -f "${AP_SOFT_DIR}/ripgrep-all/rga" ]; then
        @logshow "Create symlink from [/usr/local/bin/rga] to [${AP_SOFT_DIR}/ripgrep-all/rga]\n"
        sudo ln -sf "${AP_SOFT_DIR}/ripgrep-all/rga" "/usr/local/bin/rga"
    fi

    if [ -f "${AP_SOFT_DIR}/ripgrep-all/rga-preproc" ]; then
        @logshow "Create symlink from [/usr/local/bin/rga-preproc] to [${AP_SOFT_DIR}/ripgrep-all/rga-preproc]\n"
        sudo ln -sf "${AP_SOFT_DIR}/ripgrep-all/rga-preproc" "/usr/local/bin/rga-preproc"
    fi
}

alias @rmglobalsymlinkripgrepall="ap_func_rm_global_symlink_ripgrepall"
ap_func_rm_global_symlink_ripgrepall() {
    if [ -f "/usr/local/bin/rga" ]; then
        @logshow "Remove [/usr/local/bin/rga]\n"
        sudo rm -f "/usr/local/bin/rga"
    fi

    if [ -f "/usr/local/bin/rga-preproc" ]; then
        @logshow "Remove [/usr/local/bin/rga-preproc]\n"
        sudo rm -f "/usr/local/bin/rga-preproc"
    fi
}

alias @setupripgrepall="ap_func_setup_ripgrepall"
ap_func_setup_ripgrepall() {
    # https://github.com/phiresky/ripgrep-all
    # Dependencies: ghq, ripgrep, pandoc, poppler, tesseract, ffmpeg
    @logshow "Install [ripgrepall]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/ripgrep-all"
    rm -rf "${AP_TMP_DIR}/ripgrep-all"

    # Install ripgrep-all
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    mkdir -p "${AP_TMP_DIR}/ripgrep-all"
    cd "${AP_TMP_DIR}/ripgrep-all"
    curl -SL \
        "$(curl --silent https://api.github.com/repos/phiresky/ripgrep-all/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >rga.tar.gz
    tar -zxf rga.tar.gz
    rm -f rga.tar.gz
    mv ripgrep* ripgrep-all
    mv ripgrep-all "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/ripgrep-all"

    @createdirstructripgrepall
}

alias @rmripgrepall="ap_func_rm_ripgrepall"
ap_func_rm_ripgrepall() {
    @logshow "Remove [ripgrepall]\n"
    rm -rf "${AP_SOFT_DIR}/ripgrep-all"
    @rmdirstructripgrepall
    @rmglobalsymlinkripgrepall
}
