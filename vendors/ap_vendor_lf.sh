alias apinitlf="ap_func_init_lf"
ap_func_init_lf() {
    if alias apinitlfshare &>/dev/null; then
        apinitlfshare
    fi

    if alias apinitlfcommon &>/dev/null; then
        apinitlfcommon
    fi
}

alias apcreatedirstructlf="ap_func_create_dirstruct_lf"
ap_func_create_dirstruct_lf() {
    if alias apcreatedirstructlfshare &>/dev/null; then
        apcreatedirstructlfshare
    fi

    if alias apcreatedirstructlfcommon &>/dev/null; then
        apcreatedirstructlfcommon
    fi
}

alias rmdirstructlf="ap_func_rm_dirstruct_lf"
ap_func_rm_dirstruct_lf() {
    if alias rmdirstructlfshare &>/dev/null; then
        rmdirstructlfshare
    fi

    if alias rmdirstructlfcommon &>/dev/null; then
        rmdirstructlfcommon
    fi
}

alias apcreateglobalsymlinklf="ap_func_create_global_symlink_lf"
ap_func_create_global_symlink_lf() {
    if [ -f "${GOPATH}/bin/lf" ]; then
        aplogshow "Create symlink from [/usr/local/bin/lf] to [${GOPATH}/bin/lf]\n"
        sudo ln -sf "${GOPATH}/bin/lf" "/usr/local/bin/lf"
    fi
}

alias rmglobalsymlinklf="ap_func_rm_global_symlink_lf"
ap_func_rm_global_symlink_lf() {
    if [ -f "/usr/local/bin/lf" ]; then
        aplogshow "Remove [/usr/local/bin/lf]\n"
        sudo rm -f "/usr/local/bin/lf"
    fi
}

alias apsetuplf="ap_func_setup_lf"
ap_func_setup_lf() {
    # https://github.com/gokcehan/lf
    aplogshow "Install [lf]\n"
    env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

    apinitlf
    if alias apcreatedirstructlf &>/dev/null; then
        apcreatedirstructlf
    fi
}

alias rmlf="ap_func_rm_lf"
ap_func_rm_lf() {
    aplogshow "Remove [lf]\n"

    rm -f "${GOPATH}/bin/lf"
    rm -rf "${GOPATH}/pkg/mod/gokcehan/lf@"*

    if alias rmdirstructlf &>/dev/null; then
        rmdirstructlf
    fi

    if alias rmglobalsymlinklf &>/dev/null; then
        rmglobalsymlinklf
    fi
}
