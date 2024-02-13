alias @initlazygit="ap_func_init_lazygit"
ap_func_init_lazygit() {
    alias lg='lazygit'

    if alias @initlazygitshare &>/dev/null; then
        @initlazygitshare
    fi

    if alias @initlazygitcommon &>/dev/null; then
        @initlazygitcommon
    fi
}

alias @createdirstructlazygit="ap_func_create_dirstruct_lazygit"
ap_func_create_dirstruct_lazygit() {
    if alias @createdirstructlazygitshare &>/dev/null; then
        @createdirstructlazygitshare
    fi

    if alias @createdirstructlazygitcommon &>/dev/null; then
        @createdirstructlazygitcommon
    fi
}

alias @rmdirstructlazygit="ap_func_rm_dirstruct_lazygit"
ap_func_rm_dirstruct_lazygit() {
    if alias @rmdirstructlazygitshare &>/dev/null; then
        @rmdirstructlazygitshare
    fi

    if alias @rmdirstructlazygitcommon &>/dev/null; then
        @rmdirstructlazygitcommon
    fi
}

alias @setuplazygit="ap_func_setup_lazygit"
ap_func_setup_lazygit() {
    @logshow "Install [lazygit]\n"
    go install github.com/jesseduffield/lazygit@latest

    @initlazygit
    if alias @createdirstructlazygit &>/dev/null; then
        @createdirstructlazygit
    fi
}

alias @rmlazygit="ap_func_rm_lazygit"
ap_func_rm_lazygit() {
    @logshow "Remove [lazygit]\n"
    rm -rf "${GOPATH}/pkg/mod/github.com/jesseduffield/lazygit@"*
    rm -f "${GOPATH}/bin/lazygit"

    if alias @rmdirstructlazygit &>/dev/null; then
        @rmdirstructlazygit
    fi

    if alias @rmglobalsymlinklazygit &>/dev/null; then
        @rmglobalsymlinklazygit
    fi
}
