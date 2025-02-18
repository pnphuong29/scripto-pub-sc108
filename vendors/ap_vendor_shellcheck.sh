alias apinitshellcheck="ap_func_init_shellcheck"
ap_func_init_shellcheck() {
    if alias apinitshellcheckshare &>/dev/null; then
        apinitshellcheckshare
    fi

    if alias apinitshellcheckcommon &>/dev/null; then
        apinitshellcheckcommon
    fi
}

alias apcreatedirstructshellcheck="ap_func_create_dirstruct_shellcheck"
ap_func_create_dirstruct_shellcheck() {
    if [ -f "${HOME}/scripto-share/vendors/shellcheck/ap_shellcheckrc.sh" ]; then
        aplogshow "Create symlink from [${HOME}/.shellcheckrc] to [${HOME}/scripto-share/vendors/shellcheck/ap_shellcheckrc.sh]\n"
        ln -sf "${HOME}/scripto-share/vendors/shellcheck/ap_shellcheckrc.sh" "${HOME}/.shellcheckrc"
    fi

    if alias apcreatedirstructshellcheckshare &>/dev/null; then
        apcreatedirstructshellcheckshare
    fi

    if alias apcreatedirstructshellcheckcommon &>/dev/null; then
        apcreatedirstructshellcheckcommon
    fi
}

alias aprmdirstructshellcheck="ap_func_rm_dirstruct_shellcheck"
ap_func_rm_dirstruct_shellcheck() {
    aplogshow "Remove [${HOME}/.shellcheckrc]\n"
    rm -f "${HOME}/.shellcheckrc"

    if alias aprmdirstructshellcheckshare &>/dev/null; then
        aprmdirstructshellcheckshare
    fi

    if alias aprmdirstructshellcheckcommon &>/dev/null; then
        aprmdirstructshellcheckcommon
    fi
}

alias apsetupshellcheck="ap_func_setup_shellcheck"
ap_func_setup_shellcheck() {
    aplogshow "Install [shellcheck]\n"

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

    apinitshellcheck
    if alias apcreatedirstructshellcheck &>/dev/null; then
        apcreatedirstructshellcheck
    fi
}

alias aprmshellcheck="ap_func_rm_shellcheck"
ap_func_rm_shellcheck() {
    aplogshow "Remove [shellcheck]\n"
    rm -rf "${AP_SOFT_DIR}/shellcheck"

    if alias aprmdirstructshellcheck &>/dev/null; then
        aprmdirstructshellcheck
    fi
}
