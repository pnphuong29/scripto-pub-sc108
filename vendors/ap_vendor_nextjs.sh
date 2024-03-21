alias apinitnextjs="ap_func_init_nextjs"
ap_func_init_nextjs() {
    if alias apinitnextjsshare &>/dev/null; then
        apinitnextjsshare
    fi

    if alias apinitnextjscommon &>/dev/null; then
        apinitnextjscommon
    fi

    if alias apinitnextjsmain &>/dev/null; then
        apinitnextjsmain
    fi
}

alias apcreatedirstructnextjs="ap_func_create_dirstruct_nextjs"
ap_func_create_dirstruct_nextjs() {
    if alias apcreatedirstructnextjsshare &>/dev/null; then
        apcreatedirstructnextjsshare
    fi

    if alias apcreatedirstructnextjscommon &>/dev/null; then
        apcreatedirstructnextjscommon
    fi

    if alias apcreatedirstructnextjsmain &>/dev/null; then
        apcreatedirstructnextjsmain
    fi
}

alias aprmdirstructnextjs="ap_func_rm_dirstruct_nextjs"
ap_func_rm_dirstruct_nextjs() {
    if alias aprmdirstructnextjsshare &>/dev/null; then
        aprmdirstructnextjsshare
    fi

    if alias aprmdirstructnextjscommon &>/dev/null; then
        aprmdirstructnextjscommon
    fi

    if alias aprmdirstructnextjsmain &>/dev/null; then
        aprmdirstructnextjsmain
    fi
}

alias apsetupnextjs="ap_func_setup_nextjs"
ap_func_setup_nextjs() {
    aplogshow "Install [nextjs]\n"
    # npm install -g nextjs

    apinitnextjs
    if alias apcreatedirstructnextjs &>/dev/null; then
        apcreatedirstructnextjs
    fi
}

alias aprmnextjs="ap_func_rm_nextjs"
ap_func_rm_nextjs() {
    aplogshow "Remove [nextjs]\n"
    # npm uninstall -g nextjs

    if alias aprmdirstructnextjs &>/dev/null; then
        aprmdirstructnextjs
    fi

    if alias aprmglobalsymlinknextjs &>/dev/null; then
        aprmglobalsymlinknextjs
    fi
}
