alias @initghq="ap_func_init_ghq"
ap_func_init_ghq() {
    # https://github.com/x-motemen/ghq
    export GHQ_ROOT="${AP_PRJ_DIR}"

    if alias @initghqshare &>/dev/null; then
        @initghqshare
    fi

    if alias @initghqcommon &>/dev/null; then
        @initghqcommon
    fi
}

alias @createdirstructghq="ap_func_create_dirstruct_ghq"
ap_func_create_dirstruct_ghq() {
    if alias @createdirstructghqshare &>/dev/null; then
        @createdirstructghqshare
    fi

    if alias @createdirstructghqcommon &>/dev/null; then
        @createdirstructghqcommon
    fi
}

alias @rmdirstructghq="ap_func_rm_dirstruct_ghq"
ap_func_rm_dirstruct_ghq() {
    if alias @rmdirstructghqshare &>/dev/null; then
        @rmdirstructghqshare
    fi

    if alias @rmdirstructghqcommon &>/dev/null; then
        @rmdirstructghqcommon
    fi
}

alias @setupghq="ap_func_setup_ghq"
ap_func_setup_ghq() {
    # https://github.com/x-motemen/ghq
    @logshow "Install [ghq]\n"
    go install github.com/x-motemen/ghq@latest

    @initghq
    if alias @createdirstructghq &>/dev/null; then
        @createdirstructghq
    fi
}

alias @rmghq="ap_func_rm_ghq"
ap_func_rm_ghq() {
    @logshow "Remove [ghq]\n"

    local ap_go_path
    ap_go_path="$(go env GOPATH)"
    rm -rf "${ap_go_path}/pkg/mod/github.com/x-motemen/ghq@"*
    rm -f "${ap_go_path}/bin/ghq"

    if alias @rmdirstructghq &>/dev/null; then
        @rmdirstructghq
    fi

    if alias @rmglobalsymlinkghq &>/dev/null; then
        @rmglobalsymlinkghq
    fi
}
