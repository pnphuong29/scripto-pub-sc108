alias @initfd="ap_func_init_fd"
ap_func_init_fd() {
    # https://github.com/sharkdp/fd
    alias fd="fd --hidden --no-ignore"
    alias fdls='fd --max-depth 1 --list-details'
    alias fdexclude="fd --hidden --no-ignore --exclude .git --exclude node_modules"

    if alias @initfdshare &>/dev/null; then
        @initfdshare
    fi

    if alias @initfdcommon &>/dev/null; then
        @initfdcommon
    fi
}

alias @createdirstructfd="ap_func_create_dir_struct_fd"
ap_func_create_dir_struct_fd() {
    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/fd] to [${AP_SOFT_DIR}/fd/fd]\n"
    ln -sf "${AP_SOFT_DIR}/fd/fd" "${AP_SOFT_DIR}/bin/fd"

    @logshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_fd.bash] to [${AP_SOFT_DIR}/fd/complete/fd.bash]\n"
    ln -sf "${AP_SOFT_DIR}/fd/autocomplete/fd.bash" "${AP_COMPLETIONS_DIR}/ap_completion_fd.bash"

    @logshow "Create symlink from [${AP_MAN_DIR}/man1/fd.1] to [${AP_SOFT_DIR}/fd/fd.1]\n"
    ln -sf "${AP_SOFT_DIR}/fd/fd.1" "${AP_MAN_DIR}/man1/fd.1"

    if [ ! -d "${HOME}/.config/fd" ]; then
        @logshow "Create directory [${HOME}/.config/fd]"
        mkdir -p "${HOME}/.config/fd"
    fi

    if alias @createdirstructfdshare &>/dev/null; then
        @createdirstructfdshare
    fi

    if alias @createdirstructfdcommon &>/dev/null; then
        @createdirstructfdcommon
    fi
}

alias @rmdirstructfd="ap_func_rm_dirstruct_fd"
ap_func_rm_dirstruct_fd() {
    @logshow "Remove [${AP_SOFT_DIR}/bin/fd]\n"
    rm -f "${AP_SOFT_DIR}/bin/fd"

    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fd.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fd.bash"

    @logshow "Remove [${AP_MAN_DIR}/man1/fd.1]\n"
    rm -f "${AP_MAN_DIR}/man1/fd.1"

    if alias @rmdirstructfdshare &>/dev/null; then
        @rmdirstructfdshare
    fi

    if alias @rmdirstructfdcommon &>/dev/null; then
        @rmdirstructfdcommon
    fi
}

alias @createglobalsymlinkfd="ap_func_create_global_symlink_fd"
ap_func_create_global_symlink_fd() {
    if [ -f "${AP_SOFT_DIR}/bin/fd" ]; then
        @logshow "Create symlink from [/usr/local/bin/fd] to [${AP_SOFT_DIR}/bin/fd]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/fd" "/usr/local/bin/fd"
    fi
}

alias @rmglobalsymlinkfd="ap_func_rm_global_symlink_fd"
ap_func_rm_global_symlink_fd() {
    if [ -f "/usr/local/bin/fd" ]; then
        @logshow "Remove [/usr/local/bin/fd]\n"
        sudo rm -f "/usr/local/bin/fd"
    fi
}

alias @setupfd="ap_func_setup_fd"
ap_func_setup_fd() {
    # https://github.com/sharkdp/fd
    @logshow "Install [fd]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/fd"
    rm -rf "${AP_TMP_DIR}/fd"

    # Install fd
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux-musl"
    fi

    mkdir -p "${AP_TMP_DIR}/fd"
    cd "${AP_TMP_DIR}/fd"
    curl -SL \
        "$(curl --silent https://api.github.com/repos/sharkdp/fd/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >fd.tar.gz
    tar -zxf fd.tar.gz
    rm -f fd.tar.gz
    mv fd* fd
    mv fd "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/fd"

    @initfd
    if alias @createdirstructfd &>/dev/null; then
        @createdirstructfd
    fi
}

alias @rmfd="ap_func_rm_fd"
ap_func_rm_fd() {
    @logshow "Remove [fd]\n"

    rm -rf "${AP_SOFT_DIR}/fd"
    rm -rf "${HOME}/.config/fd"

    if alias @rmdirstructfd &>/dev/null; then
        @rmdirstructfd
    fi

    if alias @rmglobalsymlinkfd &>/dev/null; then
        @rmglobalsymlinkfd
    fi
}
