alias initemojify="ap_func_init_emojify"
ap_func_init_emojify() {
    if alias iniemojifyshare &>/dev/null; then
        iniemojifyshare
    fi

    if alias iniemojifycommon &>/dev/null; then
        iniemojifycommon
    fi
}

alias apsetupemojify="ap_func_setup_emojify"
ap_func_setup_emojify() {
    aplogshow "Install [emojify]\n"
    curl -SL https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o "${AP_SOFT_DIR}/bin/emojify"
    chmod +x "${AP_SOFT_DIR}/bin/emojify"
}

alias aprmemojify="ap_func_rm_emojify"
ap_func_rm_emojify() {
    aplogshow "Remove [emojify]\n"
    rm -f "${AP_SOFT_DIR}/bin/emojify"
}
