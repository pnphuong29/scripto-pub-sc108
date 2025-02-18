alias apinitripgrep="ap_func_init_ripgrep"
ap_func_init_ripgrep() {
    if alias apinitripgrepshare &>/dev/null; then
        apinitripgrepshare
    fi

    if alias apinitripgrepcommon &>/dev/null; then
        apinitripgrepcommon
    fi
}

alias apcreatedirstructripgrep="ap_func_create_dirstruct_ripgrep"
ap_func_create_dirstruct_ripgrep() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/rg] to [${AP_SOFT_DIR}/ripgrep/rg]\n"
    ln -sf "${AP_SOFT_DIR}/ripgrep/rg" "${AP_SOFT_DIR}/bin/rg"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_rg.bash] to [${AP_SOFT_DIR}/ripgrep/complete/rg.bash]\n"
    ln -sf "${AP_SOFT_DIR}/ripgrep/complete/rg.bash" "${AP_COMPLETIONS_DIR}/ap_completion_rg.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/rg.1] to [${AP_SOFT_DIR}/ripgrep/doc/rg.1]\n"
    ln -sf "${AP_SOFT_DIR}/ripgrep/doc/rg.1" "${AP_MAN_DIR}/man1/rg.1"

    if alias apcreatedirstructripgrepshare &>/dev/null; then
        apcreatedirstructripgrepshare
    fi

    if alias apcreatedirstructripgrepcommon &>/dev/null; then
        apcreatedirstructripgrepcommon
    fi
}

alias aprmdirstructripgrep="ap_func_rm_dirstruct_ripgrep"
ap_func_rm_dirstruct_ripgrep() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/rg]\n"
    rm -f "${AP_SOFT_DIR}/bin/rg"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_rg.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rg.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/rg.1]\n"
    rm -f "${AP_MAN_DIR}/man1/rg.1"

    if alias aprmdirstructripgrepshare &>/dev/null; then
        aprmdirstructripgrepshare
    fi

    if alias aprmdirstructripgrepcommon &>/dev/null; then
        aprmdirstructripgrepcommon
    fi
}

alias apcreateglobalsymlinkripgrep="ap_func_create_global_symlink_ripgrep"
ap_func_create_global_symlink_ripgrep() {
    if [ -f "${AP_SOFT_DIR}/bin/rg" ]; then
        aplogshow "Create symlink from [/usr/local/bin/rg] to [${AP_SOFT_DIR}/bin/rg]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/rg" "/usr/local/bin/rg"
    fi
}

alias aprmglobalsymlinkripgrep="ap_func_rm_global_symlink_ripgrep"
ap_func_rm_global_symlink_ripgrep() {
    if [ -f "/usr/local/bin/rg" ]; then
        aplogshow "Remove [/usr/local/bin/rg]\n"
        sudo rm -f "/usr/local/bin/rg"
    fi
}

alias apsetupripgrep="ap_func_setup_ripgrep"
ap_func_setup_ripgrep() {
    # Require [asciidoctor, jq] for generating manpage (use `gem install asciidoctor`)
    # https://github.com/BurntSushi/ripgrep
    aplogshow "Install [ripgrep]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/ripgrep"
    rm -rf "${AP_TMP_DIR}/ripgrep"

    # Install ripgrep
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    mkdir -p "${AP_TMP_DIR}/ripgrep"
    cd "${AP_TMP_DIR}/ripgrep"
    curl -SL \
        "$(curl --silent https://api.github.com/repos/BurntSushi/ripgrep/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >ripgrep.tar.gz
    tar -zxf ripgrep.tar.gz
    rm -f ripgrep.tar.gz
    mv ripgrep* ripgrep
    mv ripgrep "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/ripgrep"

    apinitripgrep
    apcreateglobalsymlinkripgrep

    if alias apcreatedirstructripgrep &>/dev/null; then
        apcreatedirstructripgrep
    fi
}

alias aprmripgrep="ap_func_rm_ripgrep"
ap_func_rm_ripgrep() {
    aplogshow "Remove [ripgrep]\n"
    rm -rf "${AP_SOFT_DIR}/ripgrep"

    if alias aprmdirstructripgrep &>/dev/null; then
        aprmdirstructripgrep
    fi

    if alias aprmglobalsymlinkripgrep &>/dev/null; then
        aprmglobalsymlinkripgrep
    fi
}
