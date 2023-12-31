alias @initfiglet="ap_func_init_figlet"
ap_func_init_figlet() {
    if alias @initfigletshare &>/dev/null; then
        @initfigletshare
    fi

    if alias @initfigletcommon &>/dev/null; then
        @initfigletcommon
    fi
}

alias @createdirstructfiglet="ap_func_create_dirstruct_figlet"
ap_func_create_dirstruct_figlet() {
    if alias @createdirstructfigletshare &>/dev/null; then
        @createdirstructfigletshare
    fi

    if alias @createdirstructfigletcommon &>/dev/null; then
        @createdirstructfigletcommon
    fi
}

alias @rmdirstructfiglet="ap_func_remove_dirstruct_figlet"
ap_func_remove_dirstruct_figlet() {
    if alias @rmdirstructfigletshare &>/dev/null; then
        @rmdirstructfigletshare
    fi

    if alias @rmdirstructfigletcommon &>/dev/null; then
        @rmdirstructfigletcommon
    fi
}

alias @setupfiglet="ap_func_setup_figlet"
ap_func_setup_figlet() {
    # https://github.com/cmatsuoka/figlet
    @logshow "Install [figlet]\n"
    cd "${AP_TMP_DIR}"
    git clone https://github.com/cmatsuoka/figlet
    cd figlet
    sudo make install
}

alias @rmfiglet="ap_func_remove_figlet"
ap_func_remove_figlet() {
    # https://github.com/cmatsuoka/figlet
    @logshow "Remove [figlet]\n"
    sudo rm -rf /usr/local/share/figlet

    cd /usr/local/bin
    sudo rm -f figlet chkfont figlist showfigfonts

    cd /usr/local/man/man6
    sudo rm -f figlet.6 chkfont.6 figlist.6 showfigfonts.6
}
