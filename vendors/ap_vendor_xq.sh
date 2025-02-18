alias apinitxq="ap_func_init_xq"
ap_func_init_xq() {
    if alias apinitxqshare &>/dev/null; then
        apinitxqshare
    fi

    if alias apinitxqcommon &>/dev/null; then
        apinitxqcommon
    fi

    if alias apinitxqmain &>/dev/null; then
        apinitxqmain
    fi
}

alias apcreatedirstructxq="ap_func_create_dirstruct_xq"
ap_func_create_dirstruct_xq() {
    if alias apcreatedirstructxqshare &>/dev/null; then
        apcreatedirstructxqshare
    fi

    if alias apcreatedirstructxqcommon &>/dev/null; then
        apcreatedirstructxqcommon
    fi

    if alias apcreatedirstructxqmain &>/dev/null; then
        apcreatedirstructxqmain
    fi
}

alias aprmdirstructxq="ap_func_rm_dirstruct_xq"
ap_func_rm_dirstruct_xq() {
    if alias aprmdirstructxqshare &>/dev/null; then
        aprmdirstructxqshare
    fi

    if alias aprmdirstructxqcommon &>/dev/null; then
        aprmdirstructxqcommon
    fi

    if alias aprmdirstructxqmain &>/dev/null; then
        aprmdirstructxqmain
    fi
}

alias apcreateglobalsymlinkxq="ap_func_create_global_symlink_xq"
ap_func_create_global_symlink_xq() {
    if [ -f "${GOPATH}/bin/xq" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/xq] to [${GOPATH}/bin/xq]\n"
        sudo ln -sf "${GOPATH}/bin/xq" "/usr/local/bin/xq"
    fi
}

alias aprmglobalsymlinkxq="ap_func_rm_global_symlink_xq"
ap_func_rm_global_symlink_xq() {
    if [ -f "/usr/local/bin/xq" ]; then
        apshowmsginfo "Remove [/usr/local/bin/xq]\n"
        sudo rm -f "/usr/local/bin/xq"
    fi
}

alias apsetupxq="ap_func_setup_xq"
ap_func_setup_xq() {
    apshowmsginfo "Install [xq]\n"

    go install github.com/sibprogrammer/xq@latest
    apinitxq
    apcreateglobalsymlinkxq

    if alias apcreatedirstructxq &>/dev/null; then
        apcreatedirstructxq
    fi
}

alias aprmxq="ap_func_rm_xq"
ap_func_rm_xq() {
    apshowmsginfo "Remove [xq]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/sibprogrammer/xq@"*
    rm -f "${GOPATH}/bin/xq"

    if alias aprmdirstructxq &>/dev/null; then
        aprmdirstructxq
    fi

    if alias aprmglobalsymlinkxq &>/dev/null; then
        aprmglobalsymlinkxq
    fi
}
