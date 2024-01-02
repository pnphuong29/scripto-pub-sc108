alias @initlf="ap_func_init_lf"
ap_func_init_lf() {
    alias visclf="vi -p \
        \${HOME}/scripto/ap_vendor_lf.sh \
        \${HOME}/scripto/vendors/lf/ap_lfrc.conf \
	"

    if alias @initlfshare &>/dev/null; then
        @initlfshare
    fi

    if alias @initlfcommon &>/dev/null; then
        @initlfcommon
    fi
}

alias @createdirstructlf="ap_func_create_dirstruct_lf"
ap_func_create_dirstruct_lf() {
    # https://github.com/gokcehan/lf/blob/master/doc.md
    # Link lf config file
    if [ ! -d "${HOME}/.config/lf" ]; then
        @logshow "Create directories [${HOME}/.config/lf]\n"
        mkdir -p "${HOME}/.config/lf"

        if [ -f "${HOME}/scripto/vendors/lf/ap_lfrc.conf" ]; then
            @logshow "Create symlink from [${HOME}/.config/lf/lfrc] to [${HOME}/scripto/vendors/lf/ap_lfrc.conf]\n"
            ln -sf "${HOME}/scripto/vendors/lf/ap_lfrc.conf" "${HOME}/.config/lf/lfrc"
        fi
    fi

    if alias @createdirstructlfshare &>/dev/null; then
        @createdirstructlfshare
    fi

    if alias @createdirstructlfcommon &>/dev/null; then
        @createdirstructlfcommon
    fi
}

alias @rmdirstructlf="ap_func_rm_dirstruct_lf"
ap_func_rm_dirstruct_lf() {
    @logshow "Remove [${HOME}/.config/lf]\n"
    rm -rf "${HOME}/.config/lf"

    if alias @rmdirstructlfshare &>/dev/null; then
        @rmdirstructlfshare
    fi

    if alias @rmdirstructlfcommon &>/dev/null; then
        @rmdirstructlfcommon
    fi
}

alias @createglobalsymlinklf="ap_func_create_global_symlink_lf"
ap_func_create_global_symlink_lf() {
    if [ -f "${GOPATH}/bin/lf" ]; then
        @logshow "Create symlink from [/usr/local/bin/lf] to [${GOPATH}/bin/lf]\n"
        sudo ln -sf "${GOPATH}/bin/lf" "/usr/local/bin/lf"
    fi
}

alias @rmglobalsymlinklf="ap_func_rm_global_symlink_lf"
ap_func_rm_global_symlink_lf() {
    if [ -f "/usr/local/bin/lf" ]; then
        @logshow "Remove [/usr/local/bin/lf]\n"
        sudo rm -f "/usr/local/bin/lf"
    fi
}

alias @setuplf="ap_func_setup_lf"
ap_func_setup_lf() {
    # https://github.com/gokcehan/lf
    @logshow "Install [lf]\n"
    env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

    @initlf
    if alias @createdirstructlf &>/dev/null; then
        @createdirstructlf
    fi
}

alias @rmlf="ap_func_rm_lf"
ap_func_rm_lf() {
    @logshow "Remove [lf]\n"

    rm -f "${GOPATH}/bin/lf"
    rm -rf "${GOPATH}/pkg/mod/gokcehan/lf@"*

    if alias @rmdirstructlf &>/dev/null; then
        @rmdirstructlf
    fi

    if alias @rmglobalsymlinklf &>/dev/null; then
        @rmglobalsymlinklf
    fi
}
