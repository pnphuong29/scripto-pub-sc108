alias @initbun="ap_func_init_bun"
ap_func_init_bun() {
    @addpath "${HOME}/.bun/bin"

    if alias @initbunshare &>/dev/null; then
        @initbunshare
    fi

    if alias @initbuncommon &>/dev/null; then
        @initbuncommon
    fi
}

alias @createdirstructbun="ap_func_create_dirstruct_bun"
ap_func_create_dirstruct_bun() {
    if alias @createdirstructbunshare &>/dev/null; then
        @createdirstructbunshare
    fi

    if alias @createdirstructbuncommon &>/dev/null; then
        @createdirstructbuncommon
    fi
}

alias @rmdirstructbun="ap_func_rm_dirstruct_bun"
ap_func_rm_dirstruct_bun() {
    if alias @rmdirstructbunshare &>/dev/null; then
        @rmdirstructbunshare
    fi

    if alias @rmdirstructbuncommon &>/dev/null; then
        @rmdirstructbuncommon
    fi
}

alias @setupbun="ap_func_setup_bun"
ap_func_setup_bun() {
    # https://bun.sh
    @logshow "Install [bun]\n"
    curl -fsSL https://bun.sh/install | bash
}

alias @rmbun="ap_func_rm_bun"
ap_func_rm_bun() {
    # https://bun.sh/docs/installation#uninstall
    @logshow "Remove [bun]\n"
    rm -rf "${HOME}/.bun"
}
