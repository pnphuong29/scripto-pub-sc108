alias @initlf="ap_func_init_lf"
ap_func_init_lf() {
    alias visclf="vi -p \
        \${HOME}/scripto/ap_vendor_lf.sh \
        \${HOME}/scripto-common/ap_vendor_lf.sh \
        \${HOME}/scripto-common/vendors/lf/ap_lfrc.conf \
	"
}

alias @createdirstructlf="ap_func_create_dirstruct_lf"
ap_func_create_dirstruct_lf() {
    # https://github.com/gokcehan/lf/blob/master/doc.md
    # Link lf config file
    if [ ! -d "${HOME}/.config/lf" ]; then
        @logshow "Create directories [${HOME}/.config/lf]\n"
        mkdir -p "${HOME}/.config/lf"

        @logshow "Create symlink from [${HOME}/.config/lf/lfrc] to [${HOME}/scripto-common/vendors/lf/ap_lfrc.conf]\n"
        ln -sf "${HOME}/scripto-common/vendors/lf/ap_lfrc.conf" "${HOME}/.config/lf/lfrc"
    fi
}

alias @rmdirstructlf="ap_func_rm_dirstruct_lf"
ap_func_rm_dirstruct_lf() {
    @logshow "Remove [${HOME}/.config/lf]\n"
    rm -f "${HOME}/.config/lf"
}

alias @createglobalsymlinklf="ap_func_create_global_symlink_lf"
ap_func_create_global_symlink_lf() {
    local ap_go_path
    ap_go_path="$(go env GOPATH)"
    if [ -f "${ap_go_path}/bin/lf" ]; then
        @logshow "Create symlink from [/usr/local/bin/lf] to [${ap_go_path}/bin/lf]\n"
        sudo ln -sf "${ap_go_path}/bin/lf" "/usr/local/bin/lf"
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
    @createdirstructlf
}

alias @rmlf="ap_func_rm_lf"
ap_func_rm_lf() {
    @logshow "Remove [lf]\n"
    local ap_go_path
    ap_go_path="$(go env GOPATH)"
    rm -f "${ap_go_path}/bin/lf"
    rm -rf "${ap_go_path}/pkg/mod/gokcehan/lf@"*
    @rmdirstructlf
    @rmglobalsymlinklf
}
