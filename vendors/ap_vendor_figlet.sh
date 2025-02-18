alias apinitfiglet="ap_func_init_figlet"
ap_func_init_figlet() {
    if alias apinitfigletshare &>/dev/null; then
        apinitfigletshare
    fi

    if alias apinitfigletcommon &>/dev/null; then
        apinitfigletcommon
    fi
}

alias apcreatedirstructfiglet="ap_func_create_dirstruct_figlet"
ap_func_create_dirstruct_figlet() {
    if alias apcreatedirstructfigletshare &>/dev/null; then
        apcreatedirstructfigletshare
    fi

    if alias apcreatedirstructfigletcommon &>/dev/null; then
        apcreatedirstructfigletcommon
    fi
}

alias aprmdirstructfiglet="ap_func_rm_dirstruct_figlet"
ap_func_rm_dirstruct_figlet() {
    if alias aprmdirstructfigletshare &>/dev/null; then
        aprmdirstructfigletshare
    fi

    if alias aprmdirstructfigletcommon &>/dev/null; then
        aprmdirstructfigletcommon
    fi
}

alias apsetupfiglet="ap_func_setup_figlet"
ap_func_setup_figlet() {
    # https://github.com/cmatsuoka/figlet
    aplogshow "Install [figlet]\n"
    cd "${AP_TMP_DIR}"
    git clone https://github.com/cmatsuoka/figlet
    cd figlet
    sudo make install
}

alias aprmfiglet="ap_func_rm_figlet"
ap_func_rm_figlet() {
    # https://github.com/cmatsuoka/figlet
    aplogshow "Remove [figlet]\n"
    sudo rm -rf /usr/local/share/figlet

    cd /usr/local/bin
    sudo rm -f figlet chkfont figlist showfigfonts

    cd /usr/local/man/man6
    sudo rm -f figlet.6 chkfont.6 figlist.6 showfigfonts.6
}
