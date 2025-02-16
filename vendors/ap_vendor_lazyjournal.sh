alias apinitlazyjournal="ap_func_init_lazyjournal"
ap_func_init_lazyjournal() {
    if alias apinitlazyjournalshare &>/dev/null; then
        apinitlazyjournalshare
    fi

    if alias apinitlazyjournalcommon &>/dev/null; then
        apinitlazyjournalcommon
    fi

    if alias apinitlazyjournalmain &>/dev/null; then
        apinitlazyjournalmain
    fi
}

alias apcreatedirstructlazyjournal="ap_func_create_dirstruct_lazyjournal"
ap_func_create_dirstruct_lazyjournal() {
    if alias apcreatedirstructlazyjournalshare &>/dev/null; then
        apcreatedirstructlazyjournalshare
    fi

    if alias apcreatedirstructlazyjournalcommon &>/dev/null; then
        apcreatedirstructlazyjournalcommon
    fi

    if alias apcreatedirstructlazyjournalmain &>/dev/null; then
        apcreatedirstructlazyjournalmain
    fi
}

alias aprmdirstructlazyjournal="ap_func_rm_dirstruct_lazyjournal"
ap_func_rm_dirstruct_lazyjournal() {
    if alias aprmdirstructlazyjournalshare &>/dev/null; then
        aprmdirstructlazyjournalshare
    fi

    if alias aprmdirstructlazyjournalcommon &>/dev/null; then
        aprmdirstructlazyjournalcommon
    fi

    if alias aprmdirstructlazyjournalmain &>/dev/null; then
        aprmdirstructlazyjournalmain
    fi
}

alias apcreateglobalsymlinklazyjournal="ap_func_create_global_symlink_lazyjournal"
ap_func_create_global_symlink_lazyjournal() {
    if [ -f "${GOPATH}/bin/lazyjournal" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/lazyjournal] to [${GOPATH}/bin/lazyjournal]\n"
        sudo ln -sf "${GOPATH}/bin/lazyjournal" "/usr/local/bin/lazyjournal"
    fi
}

alias aprmglobalsymlinklazyjournal="ap_func_rm_global_symlink_lazyjournal"
ap_func_rm_global_symlink_lazyjournal() {
    if [ -f "/usr/local/bin/lazyjournal" ]; then
        apshowmsginfo "Remove [/usr/local/bin/lazyjournal]\n"
        sudo rm -f "/usr/local/bin/lazyjournal"
    fi
}

alias apsetuplazyjournal="ap_func_setup_lazyjournal"
ap_func_setup_lazyjournal() {
    apshowmsginfo "Install [lazyjournal]\n"

    go install github.com/Lifailon/lazyjournal@latest
    apinitlazyjournal
    apcreateglobalsymlinklazyjournal

    if alias apcreatedirstructlazyjournal &>/dev/null; then
        apcreatedirstructlazyjournal
    fi
}

alias aprmlazyjournal="ap_func_rm_lazyjournal"
ap_func_rm_lazyjournal() {
    apshowmsginfo "Remove [lazyjournal]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/Lifailon/lazyjournal@"*
    rm -f "${GOPATH}/bin/lazyjournal"

    if alias aprmdirstructlazyjournal &>/dev/null; then
        aprmdirstructlazyjournal
    fi

    if alias aprmglobalsymlinklazyjournal &>/dev/null; then
        aprmglobalsymlinklazyjournal
    fi
}
