alias @iniemojify="ap_func_init_xxx"
ap_func_init_xxx() {
    if alias @iniemojifyshare &>/dev/null; then
        @iniemojifyshare
    fi

    if alias @iniemojifycommon &>/dev/null; then
        @iniemojifycommon
    fi
}

alias @setupemojify="ap_func_setup_emojify"
ap_func_setup_emojify() {
    @logshow "Install [emojify]\n"
    curl -SL https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o "${AP_SOFT_DIR}/bin/emojify"
    chmod +x "${AP_SOFT_DIR}/bin/emojify"
}

alias @rmemojify="ap_func_remove_emojify"
ap_func_remove_emojify() {
    @logshow "Remove [emojify]\n"
    rm -f "${AP_SOFT_DIR}/bin/emojify"
}
