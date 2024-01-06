alias @initshellcheck="ap_func_init_shellcheck"
ap_func_init_shellcheck() {
    if alias @initshellcheckshare &>/dev/null; then
        @initshellcheckshare
    fi

    if alias @initshellcheckcommon &>/dev/null; then
        @initshellcheckcommon
    fi
}

alias @createdirstructshellcheck="ap_func_create_dirstruct_shellcheck"
ap_func_create_dirstruct_shellcheck() {
    if [ -f "${HOME}/scripto-share/vendors/shellcheck/ap_shellcheckrc.sh" ]; then
        @logshow "Create symlink from [${HOME}/.shellcheckrc] to [${HOME}/scripto-share/vendors/shellcheck/ap_shellcheckrc.sh]\n"
        ln -sf "${HOME}/scripto-share/vendors/shellcheck/ap_shellcheckrc.sh" "${HOME}/.shellcheckrc"
    fi

    if alias @createdirstructshellcheckshare &>/dev/null; then
        @createdirstructshellcheckshare
    fi

    if alias @createdirstructshellcheckcommon &>/dev/null; then
        @createdirstructshellcheckcommon
    fi
}

alias @rmdirstructshellcheck="ap_func_rm_dirstruct_shellcheck"
ap_func_rm_dirstruct_shellcheck() {
    @logshow "Remove [${HOME}/.shellcheckrc]\n"
    rm -f "${HOME}/.shellcheckrc"

    if alias @rmdirstructshellcheckshare &>/dev/null; then
        @rmdirstructshellcheckshare
    fi

    if alias @rmdirstructshellcheckcommon &>/dev/null; then
        @rmdirstructshellcheckcommon
    fi
}

alias @setupshellcheck="ap_func_setup_shellcheck"
ap_func_setup_shellcheck() {
    @logshow "Install [shellcheck]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/shellcheck"
    rm -rf "${AP_TMP_DIR}/shellcheck"

    # Install shellcheck
    mkdir -p "${AP_TMP_DIR}/shellcheck"
    cd "${AP_TMP_DIR}/shellcheck"

    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/koalaman/shellcheck/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >shellcheck.tar.gz

    tar -zxf shellcheck.tar.gz
    rm -f shellcheck.tar.gz
    mv shellcheck* shellcheck
    mv shellcheck/shellcheck "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/shellcheck"

    @initshellcheck
    if alias @createdirstructshellcheck &>/dev/null; then
        @createdirstructshellcheck
    fi
}

alias @rmshellcheck="ap_func_rm_shellcheck"
ap_func_rm_shellcheck() {
    @logshow "Remove [shellcheck]\n"
    rm -rf "${AP_SOFT_DIR}/shellcheck"

    if alias @rmdirstructshellcheck &>/dev/null; then
        @rmdirstructshellcheck
    fi
}
