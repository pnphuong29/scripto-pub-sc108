alias apinitghq="ap_func_init_ghq"
ap_func_init_ghq() {
    # https://github.com/x-motemen/ghq
    export GHQ_ROOT="${AP_PRJ_DIR}"

    if alias apinitghqshare &>/dev/null; then
        apinitghqshare
    fi

    if alias apinitghqcommon &>/dev/null; then
        apinitghqcommon
    fi
}

alias apcreatedirstructghq="ap_func_create_dirstruct_ghq"
ap_func_create_dirstruct_ghq() {
    if alias apcreatedirstructghqshare &>/dev/null; then
        apcreatedirstructghqshare
    fi

    if alias apcreatedirstructghqcommon &>/dev/null; then
        apcreatedirstructghqcommon
    fi
}

alias aprmdirstructghq="ap_func_rm_dirstruct_ghq"
ap_func_rm_dirstruct_ghq() {
    if alias aprmdirstructghqshare &>/dev/null; then
        aprmdirstructghqshare
    fi

    if alias aprmdirstructghqcommon &>/dev/null; then
        aprmdirstructghqcommon
    fi
}

alias apsetupghq="ap_func_setup_ghq"
ap_func_setup_ghq() {
    # https://github.com/x-motemen/ghq
    aplogshow "Install [ghq]\n"
    go install github.com/x-motemen/ghq@latest

    apinitghq
    if alias apcreatedirstructghq &>/dev/null; then
        apcreatedirstructghq
    fi
}

alias aprmghq="ap_func_rm_ghq"
ap_func_rm_ghq() {
    aplogshow "Remove [ghq]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/x-motemen/ghq@"*
    rm -f "${GOPATH}/bin/ghq"

    if alias aprmdirstructghq &>/dev/null; then
        aprmdirstructghq
    fi

    if alias aprmglobalsymlinkghq &>/dev/null; then
        aprmglobalsymlinkghq
    fi
}
