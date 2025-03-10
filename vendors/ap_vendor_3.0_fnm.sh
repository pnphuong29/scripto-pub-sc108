alias apinitfnm="ap_func_init_fnm"
ap_func_init_fnm() {
    # export FNM_PATH="${HOME}/.fnm"
    # apaddpath "${FNM_PATH}"
    alias zfnm="cd \${FNM_DIR}"
    alias zfnmnodeversions="cd \${FNM_DIR}/node-versions"

    # Below codes will not work (recursive mode) when using ssh into pc7, so run `local` mode, then run `recursive` to fix
    if [ -f "${HOME}/.cargo/bin/fnm" ]; then
        eval "$(
            "${HOME}/.cargo/bin/fnm" env --use-on-cd --version-file-strategy=local --shell bash
        )"
        eval "$(
            "${HOME}/.cargo/bin/fnm" env --use-on-cd --version-file-strategy=recursive --shell bash
        )"
    fi

    NODE_PATH="$(pnpm root -g)"
    export NODE_PATH

    if alias apinitfnmshare &>/dev/null; then
        apinitfnmshare
    fi

    if alias apinitfnmcommon &>/dev/null; then
        apinitfnmcommon
    fi

    if alias apinitfnmmain &>/dev/null; then
        apinitfnmmain
    fi
}

alias apcreatedirstructfnm="ap_func_create_dirstruct_fnm"
ap_func_create_dirstruct_fnm() {
    aplogshow "Generate [fnm] bash autocomplete\n"
    fnm completions --shell bash >"${AP_COMPLETIONS_DIR}/ap_completion_fnm.bash"

    # if [ -f "${HOME}/.cargo/bin/fnm" ]; then
    #     TARGET_LINE='--version-file-strategy=recursive'
    #     MASTER_LINE='time source ~/scripto-main/ap_master.sh'
    #     if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ] && ! grep fnm "${HOME}/.profile" &>/dev/null; then
    #         gsed -i "\|${MASTER_LINE}|d" "${HOME}/.profile"
    #         echo 'eval "$("${HOME}/.cargo/bin/fnm" env --use-on-cd --version-file-strategy=recursive --shell bash)"' >>"${HOME}/.profile"
    #         gsed -i "/${TARGET_LINE}/i ${MASTER_LINE}" ~/.profile
    #     elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ] && ! grep fnm "${HOME}/.bashrc" &>/dev/null; then
    #         gsed -i "\|${MASTER_LINE}|d" "${HOME}/.bashrc"
    #         echo 'eval "$("${HOME}/.cargo/bin/fnm" env --use-on-cd --version-file-strategy=recursive --shell bash)"' >>"${HOME}/.bashrc"
    #         gsed -i "/${TARGET_LINE}/i ${MASTER_LINE}" ~/.bashrc
    #     fi
    # fi

    if alias apcreatedirstructfnmshare &>/dev/null; then
        apcreatedirstructfnmshare
    fi

    if alias apcreatedirstructfnmcommon &>/dev/null; then
        apcreatedirstructfnmcommon
    fi

    if alias apcreatedirstructfnmmain &>/dev/null; then
        apcreatedirstructfnmmain
    fi
}

alias aprmdirstructfnm="ap_func_rm_dirstruct_fnm"
ap_func_rm_dirstruct_fnm() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fnm.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fnm.bash"

    if alias aprmdirstructfnmshare &>/dev/null; then
        aprmdirstructfnmshare
    fi

    if alias aprmdirstructfnmcommon &>/dev/null; then
        aprmdirstructfnmcommon
    fi

    if alias aprmdirstructfnmmain &>/dev/null; then
        aprmdirstructfnmmain
    fi
}

alias apsetupfnm="ap_func_setup_fnm"
ap_func_setup_fnm() {
    aplogshow "Install [fnm]\n"
    cargo install fnm

    aplogshow "Install node version [${AP_NODE_VERSION_DEFAULT}]\n"
    fnm install "${AP_NODE_VERSION_DEFAULT}"

    aplogshow "Set default node version [${AP_NODE_VERSION_DEFAULT}]\n"
    fnm default "${AP_NODE_VERSION_DEFAULT}"

    eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell bash)"
    npm install -g pnpm

    apinitfnm
    if alias apcreatedirstructfnm &>/dev/null; then
        apcreatedirstructfnm
    fi
}

alias aprmfnm="ap_func_rm_fnm"
ap_func_rm_fnm() {
    aplogshow "Remove [fnm]\n"
    cargo uninstall fnm

    if alias aprmdirstructfnm &>/dev/null; then
        aprmdirstructfnm
    fi

    if alias aprmglobalsymlinkfnm &>/dev/null; then
        aprmglobalsymlinkfnm
    fi
}
