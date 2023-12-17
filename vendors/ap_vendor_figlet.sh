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
